import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart';

import '../../database/database.dart';
import 'http_cached_request.dart';
import 'http_store.dart';

class DatabaseHttpStore implements HttpStore {
  final HfwDatabase db;
  DatabaseHttpStore(this.db);

  @override
  Future<HttpCachedRequest?> get(
    BaseRequest request,
  ) async {
    final current = await db //
        .getRequestCacheByUrl(request.url.toString())
        .getSingleOrNull();
    if (current != null) {
      return HttpCachedRequest(
        method: request.method,
        url: request.url,
        headers: (jsonDecode(current.headers) as Map)
            .map((key, value) => MapEntry(key, value.toString())),
        body: current.body,
        created: current.created,
        updated: current.updated,
      );
    }
    return null;
  }

  @override
  FutureOr<HttpCachedRequest> save(
    BaseRequest request,
    StreamedResponse response, {
    HttpCachedRequest? current,
  }) async {
    final url = request.url.toString();
    var current = await db //
        .getRequestCacheByUrl(url)
        .getSingleOrNull();
    final bytes = await response.stream.toBytes();
    final now = DateTime.now();
    if (current != null) {
      await db.updateRequestCache(
        url,
        jsonEncode(response.headers),
        bytes,
        now,
        current.id,
      );
    } else {
      await db.createRequestCache(
        url,
        jsonEncode(response.headers),
        bytes,
        now,
        now,
      );
    }
    current = await db //
        .getRequestCacheByUrl(url)
        .getSingle();
    return HttpCachedRequest(
      method: request.method,
      url: request.url,
      headers: (jsonDecode(current.headers) as Map)
          .map((key, value) => MapEntry(key, value.toString())),
      body: current.body,
      created: current.created,
      updated: current.updated,
    );
  }

  @override
  FutureOr<void> clear([bool onlyExpired = false]) async {
    await db.deleteAllRequestCache();
  }
}
