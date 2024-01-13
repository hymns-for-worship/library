// These imports are necessary to open the sqlite3 database
import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

LazyDatabase connectDb(
  String name, {
  bool logStatements = false,
  bool delete = false,
}) {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'databases', name));
    if (delete) {
      await file.delete(recursive: true);
      await file.create(recursive: true);
    }
    return NativeDatabase.createInBackground(
      file,
      logStatements: logStatements,
      setup: (db) async {
         db.execute('PRAGMA journal_mode=WAL');
         db.execute('PRAGMA busy_timeout=100');
      },
    );
  });
}
