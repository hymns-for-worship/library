import 'package:drift/drift.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/id.dart';

class EditPlaylist {
  final HfwDatabase db;
  const EditPlaylist(this.db);

  Future<Playlist> call(Playlist data, String userId) async {
    Playlist playlist = data;
    if (data.id.isEmpty) {
      final id = generateId();
      final now = DateTime.now();
      playlist = data.copyWith(
        id: id,
        created: now,
        updated: now,
        collectionId: 'playlists',
        collectionName: 'playlists',
        deleted: false,
        synced: false,
        user: Value(userId),
      );
      await db.createRecordModel(
        playlist.id,
        playlist.collectionId,
        playlist.collectionName,
        playlist.toJsonString(),
        playlist.deleted,
        playlist.synced,
        playlist.created,
        playlist.updated,
      );
    } else {
      final now = DateTime.now();
      playlist = data.copyWith(
        updated: now,
        synced: false,
        user: Value(userId),
      );
      await db.updateRecordModel(
        playlist.toJsonString(),
        playlist.deleted,
        playlist.synced,
        playlist.updated,
        playlist.id,
        playlist.collectionName,
      );
    }
    return playlist;
  }
}
