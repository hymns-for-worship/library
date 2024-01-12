import 'package:drift/drift.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/id.dart';

class AddHymnToPlaylist {
  final HfwDatabase db;
  const AddHymnToPlaylist(this.db);

  Future<PlaylistItem> call(
    String userId,
    Playlist data,
    Hymn hymn, {
    PlaylistItem? current,
    List<String>? parts,
  }) async {
    if (data.user != userId) {
      throw Exception('Not allowed to edit this playlist');
    }
    final items = await db
        .getItemsForPlaylist(userId, data.id)
        .get()
        .then((items) => items.toList());
    final now = DateTime.now();
    var item = current ??
        PlaylistItem(
          id: generateId(),
          deleted: false,
          synced: false,
          data: '',
          created: now,
          updated: now,
          fresh: true,
          collectionId: 'playlist_items',
          collectionName: 'playlist_items',
          playlistId: data.id,
          hymnId: hymn.id,
          user: userId,
          parts: [],
        );
    item = item.copyWith(
      updated: now,
      hymnId: Value(hymn.id),
      parts: parts ?? current?.parts ?? [],
      user: Value(userId),
    );
    if (current == null) {
      items.add(item);
    } else {
      final index = items.indexWhere((e) => e.id == current.id);
      items[index] = item;
    }
    if (current == null) {
      for (var i = 0; i < items.length; i++) {
        var item = items[i];
        item = item.copyWith(
          order: Value(i.toDouble()),
        );
        if (item.fresh == true) {
          await db.createRecordModel(
            item.toJsonString(),
            item.synced,
          );
        } else {
          await db.updateRecordModel(
            item.toJsonString(),
            item.synced,
            item.id,
            item.collectionName,
          );
        }
      }
    } else {
      await db.updateRecordModel(
        item.toJsonString(),
        item.synced,
        item.id,
        item.collectionName,
      );
    }
    return item;
  }
}
