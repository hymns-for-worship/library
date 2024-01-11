import 'dart:async';

import 'package:http/http.dart';

import 'http_cached_request.dart';
import 'http_store.dart';

class InMemoryHttpStore implements HttpStore {
  final cache = <String, HttpCachedRequest>{};

  @override
  Future<HttpCachedRequest?> get(
    final BaseRequest request,
  ) async {
    final key = request.url.toString();
    return cache[key];
  }

  @override
  FutureOr<HttpCachedRequest> save(
    final BaseRequest request,
    final StreamedResponse response, {
    HttpCachedRequest? current,
  }) async {
    final key = request.url.toString();
    return cache[key] = await _save(request, response, current);
  }

  Future<HttpCachedRequest> _save(
    BaseRequest request,
    StreamedResponse response,
    HttpCachedRequest? current,
  ) async {
    final bytes = await response.stream.toBytes();
    final headers = response.headers;
    final now = DateTime.now();
    if (current != null) {
      return current.update(
        headers: headers,
        body: bytes,
        updated: now,
      );
    }
    return HttpCachedRequest(
      url: request.url,
      method: request.method,
      body: bytes,
      headers: headers,
      created: now,
      updated: now,
    );
  }

  @override
  FutureOr<void> clear([bool onlyExpired = false]) async {
    cache.clear();
  }
}
