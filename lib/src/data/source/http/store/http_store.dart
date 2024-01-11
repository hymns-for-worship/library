import 'dart:async';

import 'package:http/http.dart';

import 'http_cached_request.dart';

abstract class HttpStore {
  Future<HttpCachedRequest?> get(
    final BaseRequest request,
  );

  FutureOr<HttpCachedRequest> save(
    final BaseRequest request,
    final StreamedResponse response, {
    HttpCachedRequest? current,
  });

  FutureOr<void> clear([bool onlyExpired = false]);
}
