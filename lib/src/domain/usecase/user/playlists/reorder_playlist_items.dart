import 'package:drift/drift.dart';

import '../../../../data/source/database/database.dart';

class ReorderPlaylistItems {
  final HfwDatabase db;
  const ReorderPlaylistItems(this.db);

  Future<void> call(
    String userId,
    Playlist data,
    int oldIndex,
    int newIndex,
  ) async {
    if (data.user != userId) {
      throw Exception('Not allowed to edit this playlist');
    }
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final items = await db
        .getItemsForPlaylist(userId, data.id)
        .get()
        .then((items) => items.toList());
    final item = items.removeAt(oldIndex);
    items.insert(newIndex, item);
    for (var i = 0; i < items.length; i++) {
      var item = items[i];
      item = item.copyWith(
        order: Value(i.toDouble()),
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
}
