import 'dart:isolate';

import 'package:drift/isolate.dart';

import '../../../data/source/database/database.dart';

import 'web.dart' as web;

class SyncBackgroundService extends web.SyncBackgroundService {
  SyncBackgroundService(super.db);

  @override
  bool get active => _database != null;
  static HfwDatabase? _database;

  Future<HfwDatabase> open() async {
    if (_database != null) return _database!;
    final connection = await db.serializableConnection();
    _database = HfwDatabase(await connection.connect());
    return _database!;
  }

  Future<void> close() async {
    await _database?.close();
    _database = null;
  }

  @override
  Future<void> call(String userId) => Isolate.run(
        // TODO: Migrate old data on server
        () async => super.call(userId),
        debugName: 'Background sync service for $userId',
      );
}
