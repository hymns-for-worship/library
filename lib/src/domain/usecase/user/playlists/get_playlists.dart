import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/pocketbase/client.dart';

class GetPlaylists {
  final HfwStudio client;
  final HfwDatabase db;
  void Function()? _dispose;
  late final collection = client.collection('playlists');

  GetPlaylists({
    required this.client,
    required this.db,
  });

  Future<void> subscribe(String userId) async {
    final current = await collection.getFullList();
    for (final item in current) {
      await db.saveRecordModel(item);
    }
    _dispose?.call();
    _dispose = await collection.subscribe('*', (e) async {
      final item = e.record;
      switch (e.action) {
        case 'create':
        case 'update':
          if (item != null) {
            await db.saveRecordModel(item);
          }
          break;
        case 'delete':
          if (item != null) {
            await db.updateRecordModel(
              jsonEncode(item.toJson()),
              true,
              true,
              DateTime.now(),
              item.id,
            );
          }
          break;
        default:
      }
    });
  }

  void dispose() {
    _dispose?.call();
    _dispose = null;
  }

  Selectable<Playlist> call(String userId) {
    return db.getPlaylists(userId, null);
  }
}
