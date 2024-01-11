import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:drift/drift.dart';
import 'package:http/http.dart';
import 'package:cachecontrol/cachecontrol.dart' as cc;
import 'package:retry/retry.dart';

import 'store/http_cached_request.dart';
import 'store/http_store.dart';

class HttpGetCache extends BaseClient {
  final HttpStore store;
  final Client inner;
  final Duration timeout;
  final String cacheControlKey;
  final bool verbose;
  final List<String> methods;
  final bool requestCacheControlHeaderOverride;

  HttpGetCache({
    required this.store,
    required this.inner,
    this.timeout = const Duration(seconds: 30),
    this.cacheControlKey = 'Cache-Control',
    this.verbose = false,
    this.methods = const ['GET'],
    this.requestCacheControlHeaderOverride = true,
  });

  void log(String message) {
    if (!verbose) return;
    // ignore: avoid_print
    print(message);
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

  Future<StreamedResponse> _saveRequest(
    BaseRequest request,
    HttpCachedRequest? current,
  ) async {
    log('saving request: ${request.url} [${request.headers}]');
    if (methods.contains(request.method)) {
      final response = await _makeRequest(request);
      if (response.statusCode == 200) {
        var cacheHeader = response.headers[cacheControlKey];
        if (cacheHeader == null && requestCacheControlHeaderOverride) {
          cacheHeader = request.headers[cacheControlKey];
        }
        if (cacheHeader != null) {
          final cache = cc.parse(cacheHeader);
          if ((cache.maxAge != 0 || cache.immutable == true) &&
              (cache.noStore != true && cache.noCache != true)) {
            final res = await store.save(request, response, current: current);
            return _responseFromBytes(
              response.headers,
              res.body,
            );
          }
        }
      }
      return response;
    } else {
      return _makeRequest(request);
    }
  }

  Future<StreamedResponse> _attemptRequest(BaseRequest request) async {
    log('send request: ${request.url} [${request.headers}]');
    // Check for a request in the cache
    final current = await store.get(request);
    if (current != null) {
      var cacheHeader = current.headers[cacheControlKey];
      if (cacheHeader == null && requestCacheControlHeaderOverride) {
        cacheHeader = request.headers[cacheControlKey];
      }
      if (cacheHeader != null) {
        final cache = cc.parse(cacheHeader);
        if (cache.noStore != true &&
            cache.noCache != true &&
            cache.mustRevalidate != true &&
            cache.maxAge != 0) {
          // Check if content never changes
          if (cache.immutable == true && cache.mustRevalidate != true) {
            return _responseFromBytes(current.headers, current.body);
          }
          // Check to see if the request is not stale
          final requestDate = current.updated;
          final currentDate = DateTime.now();
          if (cache.mustRevalidate == true) {
            return await _saveRequest(request, current);
          }
          if (cache.maxAge != null) {
            // Check if stale
            if (currentDate.difference(requestDate).inSeconds > cache.maxAge!) {
              // If stale check if needs stale while revalidate
              //and send stale response first
              final staleWhileRevalidate = cache.staleWhileRevalidate;
              if (staleWhileRevalidate != null &&
                  currentDate.difference(requestDate).inSeconds >
                      staleWhileRevalidate) {
                _saveRequest(request, current).ignore();
              } else {
                return await _saveRequest(request, current);
              }
            }
            return _responseFromBytes(current.headers, current.body);
          }
        }
      }
    }
    return await _saveRequest(request, current);
  }

  StreamedResponse _responseFromBytes(
    Map<String, String> headers,
    Uint8List? bytes,
  ) {
    return StreamedResponse(
      Stream.fromIterable([if (bytes != null) bytes]),
      200,
      headers: headers,
    );
  }

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    if (methods.contains(request.method)) {
      return _attemptRequest(request);
    }
    return _makeRequest(request);
  }
}
