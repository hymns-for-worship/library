import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:async/async.dart';
import 'package:http/http.dart';
import 'package:retry/retry.dart';

import '../database/database.dart';
import 'retry_request.dart';
import 'store/http_cached_request.dart';

class HttpOfflineQueue extends BaseClient {
  final HfwDatabase db;
  final Client inner;
  final int retries;
  final Duration timeout;
  final bool verbose;
  final List<String> methods;
  final Future<StreamedResponse?> Function(BaseRequest request, Object? error)?
      optimisticResponse;

  HttpOfflineQueue({
    required this.db,
    required this.inner,
    this.retries = 3,
    this.timeout = const Duration(minutes: 5),
    this.verbose = false,
    this.methods = const ['POST', 'PUT', "DELETE"],
    this.optimisticResponse,
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
      final response = await _makeRequest(OfflineRequest(HttpCachedRequest(
        method: request.method,
        headers: (jsonDecode(request.headers) as Map)
            .map((key, value) => MapEntry(key, value.toString())),
        url: Uri.parse(request.url),
        created: request.created,
        updated: request.updated,
        body: request.body ?? Uint8List(0),
      )));

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

  Future<StreamedResponse> _attemptRequest(BaseRequest request) async {
    log('saving request: ${request.url} [${request.headers}]');
    try {
      return await _makeRequest(request);
    } catch (e) {
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
      final response = await optimisticResponse?.call(request, e);
      if (response != null) return response;
      rethrow;
    }
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    if (methods.contains(request.method)) {
      return _attemptRequest(request);
    }
    return _makeRequest(request);
  }
}
