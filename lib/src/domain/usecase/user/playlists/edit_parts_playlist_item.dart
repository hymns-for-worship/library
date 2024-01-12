import 'package:drift/drift.dart';

import '../../../../data/source/database/database.dart';

class EditPartsPlaylistItem {
  final HfwDatabase db;
  const EditPartsPlaylistItem(this.db);

  Future<void> call(
    String userId,
    Playlist data,
    List<String> parts,
    PlaylistItem current,
  ) async {
    if (data.user != userId) {
      throw Exception('Not allowed to edit this playlist');
    }
    final now = DateTime.now();
    var item = current.copyWith(
      synced: false,
      updated: now,
      parts: parts,
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
