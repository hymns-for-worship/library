import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';

import '../../data/source/database/connection/connection.dart';

class ExportDatabase {
  Future<void> call(String dbName, {bool saveAs = false}) async {
    final bytes = await getDatabaseBytes(dbName);
    if (bytes == null) return;
    if (saveAs) {
      await FileSaver.instance.saveAs(
        name: dbName.split('.').first,
        bytes: Uint8List.fromList(bytes),
        ext: dbName.split('.').last,
        mimeType: MimeType.other,
      );
    } else {
      await FileSaver.instance.saveFile(
        name: dbName.split('.').first,
        bytes: Uint8List.fromList(bytes),
        ext: dbName.split('.').last,
        mimeType: MimeType.other,
      );
    }
  }
}
