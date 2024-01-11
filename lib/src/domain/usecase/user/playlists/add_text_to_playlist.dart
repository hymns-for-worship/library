import 'package:drift/drift.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/id.dart';

class AddTextToPlaylist {
  final HfwDatabase db;
  const AddTextToPlaylist(this.db);

  Future<PlaylistItem> call(
    String userId,
    Playlist data,
    String text, {
    PlaylistItem? current,
    String? color,
  }) async {
    if (data.user != userId) {
      throw Exception('Not allowed to edit this playlist');
    }
    final items = await db
        .getItemsForPlaylist(userId, data.id)
        .get()
        .then((items) => items.toList());
    final now = DateTime.now();
    final item = PlaylistItem(
      id: current?.id ?? generateId(),
      deleted: false,
      synced: false,
      data: current?.data ?? '',
      created: now,
      updated: now,
      fresh: current?.fresh ?? true,
      collectionId: 'playlists',
      collectionName: 'playlists',
      playlistId: data.id,
      text: text,
      notes: current?.notes,
      uid: current?.uid,
      parts: current?.parts,
      color: color ?? current?.color,
      order: current?.order,
    );
    if (current == null) {
      items.add(item);
    } else {
      final index = items.indexWhere((e) => e.id == current.id);
      items[index] = item;
    }
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
        item.deleted,
        item.synced,
        item.updated,
        item.id,
        item.collectionName,
      );
    }
    return item;
  }
}
