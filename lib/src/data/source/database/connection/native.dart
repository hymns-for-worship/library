import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

LazyDatabase connect(
  String dbName, {
  bool logStatements = false,
  bool inMemory = false,
  bool debug = false,
  bool delete = false,
}) {
  return LazyDatabase(() async {
    if (inMemory) {
      return DatabaseConnection(NativeDatabase.memory());
    }
    final appDir = await getApplicationDocumentsDirectory();
    final file = File(p.join(appDir.path, dbName));

    if (delete) {
      await file.delete(recursive: true);
    }

    return NativeDatabase.createInBackground(
      file,
      logStatements: logStatements,
      cachePreparedStatements: true,
    );
  });
}
