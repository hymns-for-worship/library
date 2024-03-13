import 'dart:io';

import 'package:drift/native.dart';
import 'package:hfw_core/src/domain/usecase/import_hymn.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sqlite_storage/sqlite_storage.dart';

void main(List<String> args) async {
  final file = File(args.firstOrNull ?? 'assets/library.db');
  if (file.existsSync()) {
    await file.delete();
    await file.create(recursive: true);
  }
  final db = DriftStorage(NativeDatabase(file));
  final importer = ImportHymn(db);
  final pb = PocketBase('https://hymnsforworship.studio');
  const username = 'client@hymnsforworship.app';
  const password = 'hingyv-gYrtaq-hutqe8';
  await pb.admins.authWithPassword(username, password);

  final hymns = await pb.collection('hymns').getFullList();

  var i = 0;
  for (final item in hymns) {
    final info = item.getStringValue('info');
    if (info.isEmpty) continue;
    await importer.importInfo(info);
    print('hymn: ${++i}/${hymns.length}');
  }

  await db.kv.$dateTime.set('library-update', DateTime.now());
}
