import 'dart:async';

import 'package:sqlite_storage/sqlite_storage.dart';

class RemoveHymnDownload {
  final DriftStorage storage;

  RemoveHymnDownload(this.storage);

  Future<void> call(String hymnId) async {
    final file = storage.io.file('downloads/bundles/$hymnId.zip');
    await file.delete();
  }
}
