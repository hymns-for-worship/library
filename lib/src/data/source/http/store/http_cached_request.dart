import 'dart:typed_data';

class HttpCachedRequest {
  final Uri url;
  final Map<String, String> headers;
  final Uint8List body;
  final DateTime created;
  final DateTime updated;
  final String method;

  const HttpCachedRequest({
    required this.url,
    required this.method,
    required this.headers,
    required this.body,
    required this.created,
    required this.updated,
  });

  HttpCachedRequest update({
    required Map<String, String> headers,
    required Uint8List body,
    required DateTime updated,
  }) {
    return HttpCachedRequest(
      url: url,
      method: method,
      headers: headers,
      body: body,
      created: created,
      updated: updated,
    );
  }
}
