import 'dart:convert';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/id.dart';
import '../../../model/playlist_item.dart';
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
          .getPlaylistItemsForPlaylist(data.id)
          .first
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
        'order': items.length,
      };
      map['playlist_id'] = data.id;
      map['text'] = text;
      map['color'] = color;
      final str = jsonEncode(map);
      print('saving playlist item: $str');
      final results = await db.createRecordModel(
        jsonEncode(map),
        false,
      );
      print('results: $results');
      final items1 = await db
          .getPlaylistItemsForPlaylist(data.id)
          .first
          .then((items) => items.toList());
      final items2 = await db
          .getPlaylistItemsForUser(userId)
          .first
          .then((items) => items.toList());
      final items3 = await db
          .getRecordModelByCollection('playlist_items', id)
          .get()
          .then((items) => items.toList());
      final items4 = await db //
          .getPlaylistItems()
          .get()
          .then((items) => items.toList());
      print('----------------');
      print(
          '1: ${items1.length}, 2: ${items2.length}, 3: ${items3.length}, 4: ${items4.length}');
      print(items4);
      await Future.delayed(const Duration(milliseconds: 10));
      final item = await db.getPlaylistItem(data.id, id).first;
      if (item != null) items.add(item);
      await reorder.setOrder(items);
    }
  }
}
