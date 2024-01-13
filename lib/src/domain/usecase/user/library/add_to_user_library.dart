import 'dart:convert';

import 'package:collection/collection.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/id.dart';

class AddToUserLibrary {
  final HfwDatabase db;

  AddToUserLibrary(this.db);

  Future<void> call(
    String userId, {
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
    final items = await db.getUserHymnLibrary(userId).get();
    final current = items.firstWhereOrNull((item) {
      final map = jsonDecode(item.data) as Map<String, dynamic>;
      return map.containsKey(key) && map[key] == id;
    });
    if (current != null) {
      final map = jsonDecode(current.data) as Map<String, dynamic>;
      map.remove('hymn_id');
      map.remove('topic_id');
      map.remove('stakeholder_id');
      map.remove('playlist_id');
      map[key] = id;
      await db.setRecordModel(
        jsonEncode(map),
        false,
        false,
      );
    } else {
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
      map[key] = id;
      await db.setRecordModel(
        jsonEncode(map),
        false,
        true,
      );
    }
  }
}
