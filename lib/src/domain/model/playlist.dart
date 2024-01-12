import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../data/source/database/database.dart';

extension PlaylistRecordModelUtils on RecordModel {
  Playlist toPlaylist({
    bool synced = false,
  }) {
    return Playlist(
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
      name: data['name'] as String,
      description: data['description'] as String?,
      public: data['public'] as bool?,
      medly: data['medly'] as bool?,
      supplement: data['supplement'] as bool?,
      event: data['event'] as String?,
    );
  }
}

extension PlaylistUtils on Playlist {
  Map<String, dynamic> toData() {
    return {
      'user': user,
      'uid': uid,
      'deleted': deleted,
      'name': name,
      'description': description,
      'public': public,
      'medly': medly,
      'supplement': supplement,
      'event': event,
    };
  }
}
