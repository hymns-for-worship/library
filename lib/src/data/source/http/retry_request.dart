import 'package:http/http.dart';

import 'store/http_cached_request.dart';

class OfflineRequest extends BaseRequest {
  final HttpCachedRequest data;

  OfflineRequest(this.data) : super(data.method, data.url);

  @override
  ByteStream finalize() {
    super.finalize();
    return ByteStream(Stream.fromIterable([data.body]));
  }

  @override
  int? get contentLength => data.body.length;
}
