import '../../../../data/source/database/database.dart';

class RemovePlaylistItem {
  final HfwDatabase db;
  const RemovePlaylistItem(this.db);

  Future<void> call(
    String userId,
    Playlist data,
    PlaylistItem item,
  ) async {
    if (data.user != userId) {
      throw Exception('Not allowed to edit this playlist');
    }
    // final items = await db
    //     .getItemsForPlaylist(userId, data.id)
    //     .get()
    //     .then((items) => items.toList());
    // items.removeWhere((e) => e.id == item.id);
    await db.deleteRecordModel(item.id, item.collectionName);
    await db.setSyncStatusRecordModel(false, item.id, item.collectionName);
    // for (var i = 0; i < items.length; i++) {
    //   var item = items[i];
    //   item = item.copyWith(
    //     order: Value(i.toDouble()),
    //     updated: DateTime.now(),
    //     synced: false,
    //     user: Value(userId),
    //   );
    //   await db.updateRecordModel(
    //     item.toJsonString(),
    //     item.deleted,
    //     item.synced,
    //     item.updated,
    //     item.id,
    //     item.collectionName,
    //   );
    // }
  }
}
