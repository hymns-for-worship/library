import 'dart:convert';

import 'package:collection/collection.dart';

import '../../../../data/source/database/database.dart';

class RemoveFromUserLibrary {
  final HfwDatabase db;

  RemoveFromUserLibrary(this.db);

  Future<void> call(
    String user, {
    String? hymnId,
    String? topicId,
    String? stakeholderId,
    String? playlistId,
  }) async {
    final (key, id) = () {
      if (hymnId != null) {
        return ('hymn_id', hymnId);
      } else if (topicId != null) {
        return ('topic_id', topicId);
      } else if (stakeholderId != null) {
        return ('stakeholder_id', stakeholderId);
      } else if (playlistId != null) {
        return ('playlist_id', playlistId);
      }
      throw Exception('Invalid key');
    }();
    final items = await db.getUserLibrary(user).get();
    final current = items.firstWhereOrNull((item) {
      final map = jsonDecode(item.data) as Map<String, dynamic>;
      return map.containsKey(key) && map[key] == id;
    });
    if (current != null) {
      await db.deleteRecordModel(id, 'user_library');
    }
  }
}
