import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../data/source/database/database.dart';

extension PlaylistItemRecordModelUtils on RecordModel {
  PlaylistItem toPlaylistItem({
    bool synced = false,
  }) {
    return PlaylistItem(
      collectionId: collectionId,
      collectionName: collectionName,
      synced: synced,
      deleted: data['deleted'] as bool,
      created: DateTime.parse(created),
      updated: DateTime.parse(updated),
      data: jsonEncode(toJson()),
      id: id,
      fresh: false,
      user: data['user'] as String?,
      uid: data['uid'] as String?,
      playlistId: data['playlist_id'] as String,
      hymnId: data['hymn_id'] as String?,
      image: data['image'] as String?,
      color: data['color'] as String?,
      notes: data['notes'] as String?,
      text: data['text'] as String?,
      order: (data['order'] as num?)?.toDouble(),
      parts: (data['parts'] as List?)?.cast<String>() ?? [],
    );
  }
}

extension PlaylistItemUtils on PlaylistItem {
  Map<String, dynamic> toData() {
    return {
      'user': user,
      'uid': uid,
      'deleted': deleted,
      'playlist_id': playlistId,
      'hymn_id': hymnId,
      'image': image,
      'color': color,
      'notes': notes,
      'text': text,
      'order': order,
      'parts': parts,
    };
  }
}
