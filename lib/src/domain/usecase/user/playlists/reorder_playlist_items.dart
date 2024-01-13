import 'dart:convert';

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
    await setOrder(items);
  }

  Future<void> setOrder(List<PlaylistItem> items) async {
    for (var i = 0; i < items.length; i++) {
      var item = items[i];
      final map = jsonDecode(item.data) as Map<String, dynamic>;
      map['order'] = i.toDouble();
      await db.setRecordModel(jsonEncode(map), item.synced, false);
    }
  }
}
