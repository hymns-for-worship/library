import 'dart:convert';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/id.dart';

class PlaylistData {
  String id;
  String name;
  String? description;
  DateTime? event;
  bool public;
  bool medly;
  bool supplement;

  PlaylistData({
    String? id,
    this.name = 'New Playlist',
    this.description,
    this.event,
    this.public = false,
    this.medly = false,
    this.supplement = false,
  }) : id = id ?? generateId();

  factory PlaylistData.fromPlaylist(Playlist data) {
    return PlaylistData(
      id: data.id,
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
      'description': description,
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
      await db.setRecordModel(
        jsonEncode(map),
        false,
        false,
      );
      return db.getPlaylist(userId, current.id).getSingle();
    } else {
      final now = DateTime.now();
      final map = <String, dynamic>{
        'id': data.id,
        'collectionId': 'playlists',
        'collectionName': 'playlists',
        'created': now.toIso8601String(),
        'updated': now.toIso8601String(),
        'deleted': false,
        'user': userId,
      };
      map.addAll(data.toJson());
      await db.setRecordModel(
        jsonEncode(map),
        false,
        true,
      );
      return db.getPlaylist(userId, data.id).getSingle();
    }
  }
}
