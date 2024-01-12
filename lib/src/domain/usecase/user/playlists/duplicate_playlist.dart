import 'package:drift/drift.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/id.dart';

class DuplicatePlaylist {
  final HfwDatabase db;
  const DuplicatePlaylist(this.db);

  Future<Playlist> call(Playlist data, String userId) async {
    Playlist playlist = data;
    final id = generateId();
    final now = DateTime.now();
    playlist = data.copyWith(
      id: id,
      created: now,
      updated: now,
      collectionId: 'playlists',
      collectionName: 'playlists',
      synced: false,
      fresh: const Value(true),
      user: Value(userId),
    );
    await db.createRecordModel(
      playlist.toJsonString(),
      playlist.synced,
    );
    final items = await db.getItemsForPlaylist(userId, data.id).get();
    for (var item in items) {
      final id = generateId();
      final now = DateTime.now();
      item = item.copyWith(
        id: id,
        created: now,
        updated: now,
        synced: false,
        fresh: const Value(true),
        user: Value(userId),
        playlistId: playlist.id,
      );
      await db.createRecordModel(
        item.toJsonString(),
        item.synced,
      );
    }
    return playlist;
  }
}
