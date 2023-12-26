import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:drift/drift.dart';
import 'package:http/http.dart';
import 'package:cachecontrol/cachecontrol.dart' as cc;
import 'package:retry/retry.dart';

import '../database/database.dart';
import 'retry_request.dart';

class OfflineClient extends BaseClient {
  final HfwDatabase db;
  final Client inner;
  final int retries;
  final Duration timeout;
  final String cacheControlKey;
  final bool verbose;

  OfflineClient({
    required this.db,
    required this.inner,
    this.retries = 3,
    this.timeout = const Duration(minutes: 1),
    this.cacheControlKey = 'Cache-Control',
    this.verbose = false,
  });

  void log(String message) {
    if (!verbose) return;
    // ignore: avoid_print
    print(message);
  }

  Stream<int> retryCount() => db //
      .getOfflineQueue()
      .watch()
      .map((e) => e.length);

  Future<void> retryRequests() async {
    final requests = await db.getOfflineQueue().get();
    for (final request in requests) {
      await _retryRequest(request);
    }
  }

  StreamSubscription<bool> retryRequestsOnNetworkChange(Stream<bool> network) {
    CancelableOperation? current;
    return network.distinct().listen((online) async {
      log('network status: $online');
      await current?.cancel();
      if (!online) return;
      current = CancelableOperation.fromFuture(retryRequests());
      await current!.value.whenComplete(() => current = null);
    });
  }

  Future<StreamedResponse> _makeRequest(BaseRequest request) {
    log('making request: ${request.url} - ${request.headers}');
    return retry(
      () => inner.send(request).timeout(timeout),
      // Retry on SocketException or TimeoutException
      retryIf: (e) => e is SocketException || e is TimeoutException,
      onRetry: (e) {
        log('error making request: ${request.url} [${request.headers}] - $e');
      },
    );
  }

  Future<void> _retryRequest(OfflineQueueData request) async {
    log('retry request: ${request.url} [${request.headers}]');
    try {
      final currentCount = request.retryCount;
      // final response = await inner.send(OfflineRequest(request));
      final response = await _makeRequest(OfflineRequest(request));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        await db.deleteOfflineQueueById(request.id);
        return;
      }
      if (response.statusCode >= 400 && response.statusCode <= 499) {
        await db.deleteOfflineQueueById(request.id);
        return;
      }
      if (currentCount == 0) {
        log('no more retry for request: ${request.url} [${request.method}]');
        await db.deleteOfflineQueueById(request.id);
        return;
      }
      await db.updateOfflineQueueRetry(
        currentCount - 1,
        DateTime.now(),
        request.id,
      );
    } catch (e) {
      log('error retry request: ${request.url} [${request.method}] - $e');
    }
  }

  Future<StreamedResponse> _saveRequest(
    BaseRequest request,
    RequestCacheData? current,
  ) async {
    log('saving request: ${request.url} [${request.headers}]');
    if (request.method == 'GET') {
      final response = await _makeRequest(request);
      if (response.statusCode == 200) {
        final body = await response.stream.toBytes();
        final now = DateTime.now();
        final headers = jsonEncode(request.headers);
        await db.createRequestCache(
          request.url.toString(),
          headers,
          body,
          now,
          now,
        );
      }
      return response;
    } else {
      try {
        return await _makeRequest(request);
      } on Exception {
        // Add to offline queue
        final bytes = await request.finalize().toBytes();
        final now = DateTime.now();
        final headers = jsonEncode(request.headers);
        await db.createOfflineQueue(
          request.url.toString(),
          request.method,
          bytes,
          headers,
          retries,
          now,
          now,
        );
        rethrow;
      }
    }
  }

  StreamedResponse _responseFromBytes(
    Map<String, String> headers,
    Uint8List bytes,
  ) {
    return StreamedResponse(
      Stream.fromIterable([bytes]),
      200,
      headers: headers,
    );
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    final url = request.url;
    final headers = request.headers;
    final cacheControl = cc.parse(headers[cacheControlKey]);

    log('send request: ${request.url} [${request.headers}]');
    if (cacheControl.noStore != true &&
        cacheControl.noCache != true &&
        cacheControl.mustRevalidate != true &&
        cacheControl.maxAge != 0) {
      // Check for a request in the cache
      final current = await db //
          .getRequestCacheByUrl(url.toString())
          .getSingleOrNull();
      if (current != null) {
        // Check if content never changes
        if (cacheControl.immutable == true) {
          return _responseFromBytes(headers, current.body);
        }
        // Check to see if the request is not stale
        final requestDate = current.updated;
        final currentDate = DateTime.now();
        final maxAge = cacheControl.maxAge;
        if (maxAge != null) {
          // Check if stale
          if (currentDate.difference(requestDate).inSeconds > maxAge) {
            // If stale check if needs stale while revalidate
            //and send stale response first
            final staleWhileRevalidate = cacheControl.staleWhileRevalidate;
            if (staleWhileRevalidate != null &&
                currentDate.difference(requestDate).inSeconds >
                    staleWhileRevalidate) {
              _saveRequest(request, current).ignore();
            } else {
              return await _saveRequest(request, current);
            }
          }
          return _responseFromBytes(headers, current.body);
        }
      } else if (cacheControl.maxAge != 0 || cacheControl.immutable == true) {
        return await _saveRequest(request, current);
      }
    }
    return inner.send(request);
  }
}
