import 'dart:convert';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/id.dart';

class PlaylistData {
  String name;
  String? description;
  DateTime? event;
  bool public;
  bool medly;
  bool supplement;

  PlaylistData({
    this.name = 'New Playlist',
    this.description,
    this.event,
    this.public = false,
    this.medly = false,
    this.supplement = false,
  });

  factory PlaylistData.fromPlaylist(Playlist data) {
    return PlaylistData(
      name: data.name,
      description: data.description,
      event: data.event != null ? DateTime.tryParse(data.event!) : null,
      public: data.public ?? false,
      medly: data.medly ?? false,
      supplement: data.supplement ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'event': event?.toIso8601String(),
      'public': public,
      'medly': medly,
      'supplement': supplement,
    };
  }
}

class EditPlaylist {
  final HfwDatabase db;
  const EditPlaylist(this.db);

  Future<Playlist> call(
    PlaylistData data,
    String userId, {
    Playlist? current,
  }) async {
    if (current != null) {
      final map = jsonDecode(current.data) as Map<String, dynamic>;
      map.addAll(data.toJson());
      await db.updateRecordModel(
        jsonEncode(map),
        false,
        current.id,
        current.collectionName,
      );
      return db.getPlaylist(userId, current.id).getSingle();
    } else {
      final id = generateId();
      final now = DateTime.now();
      final map = <String, dynamic>{
        'id': id,
        'collectionId': 'playlists',
        'collectionName': 'playlists',
        'created': now.toIso8601String(),
        'updated': now.toIso8601String(),
        'deleted': false,
        'user': userId,
      };
      map.addAll(data.toJson());
      await db.createRecordModel(
        jsonEncode(map),
        false,
      );
      return db.getPlaylist(userId, id).getSingle();
    }
    // Playlist playlist = data;
    // if (data.id.isEmpty) {
    //   final id = generateId();
    //   final now = DateTime.now();
    //   playlist = data.copyWith(
    //     id: id,
    //     created: now,
    //     updated: now,
    //     collectionId: 'playlists',
    //     collectionName: 'playlists',
    //     deleted: const Value(false),
    //     synced: false,
    //     user: Value(userId),
    //     fresh: const Value(true),
    //   );
    //   await db.createRecordModel(
    //     playlist.toJsonString(),
    //     playlist.synced,
    //   );
    // } else {
    //   final now = DateTime.now();
    //   playlist = data.copyWith(
    //     updated: now,
    //     synced: false,
    //     user: Value(userId),
    //   );
    //   await db.updateRecordModel(
    //     playlist.toJsonString(),
    //     playlist.synced,
    //     playlist.id,
    //     playlist.collectionName,
    //   );
    // }
    // return playlist;
  }
}
