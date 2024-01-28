import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';

import '../../../../../data/source/pocketbase/client.dart';

class DownloadHymnBundle {
  final HfwStudio client;

  DownloadHymnBundle(this.client);

  Future<void> call(
    String hymnId, {
    bool saveAs = false,
  }) async {
    final client = this.client.httpClientFactory();
    final url = Uri.parse('https://hymnsforworship.studio/hymns/$hymnId/bundle');
    final res = await client.get(url);
    if (res.statusCode != 200) {
      throw Exception('Error downloading hymn bundle');
    }
    final bytes = res.bodyBytes;
    final filename = '$hymnId.zip';
    if (saveAs) {
      await FileSaver.instance.saveAs(
        name: filename,
        bytes: Uint8List.fromList(bytes),
        ext: 'zip',
        mimeType: MimeType.zip,
      );
    } else {
      await FileSaver.instance.saveFile(
        name: filename,
        bytes: Uint8List.fromList(bytes),
        ext: 'zip',
        mimeType: MimeType.zip,
      );
    }
  }
}
