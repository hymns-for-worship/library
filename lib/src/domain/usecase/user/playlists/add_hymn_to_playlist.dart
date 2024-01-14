import 'dart:convert';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/id.dart';
import '../../../model/playlist_item.dart';
import 'reorder_playlist_items.dart';

class AddHymnToPlaylist {
  final HfwDatabase db;
  AddHymnToPlaylist(this.db);
  late final reorder = ReorderPlaylistItems(db);

  Future<void> call(
    String userId,
    Playlist data,
    Hymn hymn, {
    PlaylistItem? current,
    List<String>? parts,
  }) async {
    if (data.user != userId) {
      throw Exception('Not allowed to edit this playlist');
    }
    if (current != null) {
      final map = jsonDecode(current.data) as Map<String, dynamic>;
      map['hymn_id'] = hymn.id;
      if (current.hymnId != hymn.id) {
        map['parts'] = parts ?? [];
      } else {
        map['parts'] = parts ?? current.parts;
      }
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
      map['hymn_id'] = hymn.id;
      map['parts'] = parts ?? [];
      await db.createRecordModel(
        jsonEncode(map),
        false,
      );
      await Future.delayed(const Duration(milliseconds: 10));
      final item = await db.getPlaylistItem(data.id, id).first;
      if (item != null) items.add(item);
      await reorder.setOrder(items);
    }
  }
}
