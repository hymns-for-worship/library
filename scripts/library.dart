import 'dart:io';

import 'package:drift/native.dart';
import 'package:hfw_core/src/data/source/database/database.dart';
import 'package:hfw_core/src/domain/usecase/import_hymn.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:sqlite_storage/sqlite_storage.dart';

void main(List<String> args) async {
  final file = File(args.firstOrNull ?? 'assets/meta.db');
  final dbFile = File(args.firstOrNull ?? 'assets/library.db');
  final storage = DriftStorage(NativeDatabase(file));
  final db = HfwDatabase(NativeDatabase(dbFile));
  final importer = ImportHymn(db, storage);
  final pb = PocketBase('https://hymnsforworship.studio');
  const username = 'client@hymnsforworship.app';
  const password = 'hingyv-gYrtaq-hutqe8';
  await pb.admins.authWithPassword(username, password);

  final hymns = await pb.collection('hymns').getFullList();

  var i = 0;
  for (final item in hymns) {
    final info = item.getStringValue('info');
    if (info.isEmpty) continue;
    try {
      await importer.importInfo(info);
      print('hymn: ${++i}/${hymns.length}');
    } catch (e) {
      print('error hymn: ${++i}/${hymns.length} $e');
    }
  }

  final now = DateTime.now();
  await storage.kv.$dateTime.set('library-update', now);
  await File('assets/library.txt').writeAsString(now.toIso8601String());
}
