import 'dart:isolate';

import 'package:drift/isolate.dart';

import '../../../data/source/database/database.dart';

import 'web.dart' as web;

class SyncBackgroundService extends web.SyncBackgroundService {
  SyncBackgroundService(super.db);

  Future<HfwDatabase> open() async {
    if (web.SyncBackgroundService.database != null) {
      return web.SyncBackgroundService.database!;
    }
    final connection = await db.serializableConnection();
    web.SyncBackgroundService.database =
        HfwDatabase(await connection.connect());
    return web.SyncBackgroundService.database!;
  }

  Future<void> close() async {
    await web.SyncBackgroundService.database?.close();
    web.SyncBackgroundService.database = null;
    active = false;
  }

  @override
  Future<void> call(String userId) => Isolate.run(
        // TODO: Migrate old data on server
        () async => super.call(userId),
        debugName: 'Background sync service for $userId',
      );
}
