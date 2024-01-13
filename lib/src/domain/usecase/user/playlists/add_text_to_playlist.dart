import 'dart:convert';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/id.dart';
import 'reorder_playlist_items.dart';

class AddTextToPlaylist {
  final HfwDatabase db;
  AddTextToPlaylist(this.db);
  late final reorder = ReorderPlaylistItems(db);

  Future<void> call(
    String userId,
    Playlist data,
    String text, {
    PlaylistItem? current,
    String? color,
  }) async {
    if (data.user != userId) {
      throw Exception('Not allowed to edit this playlist');
    }
    if (current != null) {
      final map = jsonDecode(current.data) as Map<String, dynamic>;
      map['text'] = text;
      map['color'] = current.color ?? color;
      await db.setRecordModel(
        jsonEncode(map),
        false,
        false,
      );
    } else {
      final items = await db
          .getItemsForPlaylist(userId, data.id)
          .get()
          .then((items) => items.toList());
      final id = generateId();
      final now = DateTime.now();
      final map = <String, dynamic>{
        'id': id,
        'collectionId': 'playlist_items',
        'collectionName': 'playlist_items',
        'created': now.toIso8601String(),
        'updated': now.toIso8601String(),
        'deleted': false,
        'user': userId,
      };
      map['playlist_id'] = data.id;
      map['text'] = text;
      map['color'] = color;
      await db.setRecordModel(
        jsonEncode(map),
        false,
        false,
      );
      final item = await db.getPlaylistItem(id, data.id).getSingle();
      items.add(item);
      await reorder.setOrder(items);
    }
  }
}
