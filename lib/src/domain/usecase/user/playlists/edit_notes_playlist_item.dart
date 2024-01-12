import 'package:drift/drift.dart';

import '../../../../data/source/database/database.dart';

class EditNotesPlaylistItem {
  final HfwDatabase db;
  const EditNotesPlaylistItem(this.db);

  Future<void> call(
    String userId,
    Playlist data,
    String text,
    PlaylistItem current,
  ) async {
    if (data.user != userId) {
      throw Exception('Not allowed to edit this playlist');
    }
    final now = DateTime.now();
    var item = current.copyWith(
      synced: false,
      updated: now,
      notes: Value(text),
    );
    item = item.copyWith(
      updated: DateTime.now(),
      synced: false,
      user: Value(userId),
    );
    await db.updateRecordModel(
      item.toJsonString(),
      item.synced,
      item.id,
      item.collectionName,
    );
  }
}
