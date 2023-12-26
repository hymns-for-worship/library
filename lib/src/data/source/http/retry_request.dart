import 'package:http/http.dart';

import '../database/database.dart';

class OfflineRequest extends BaseRequest {
  final OfflineQueueData data;

  OfflineRequest(this.data) : super(data.method, Uri.parse(data.url));

  @override
  ByteStream finalize() {
    final Stream<List<int>> stream = data.body != null
        ? Stream.fromIterable([data.body!])
        : const Stream.empty();
    super.finalize();
    return ByteStream(stream);
  }

  @override
  int? get contentLength => data.body?.length;
}
