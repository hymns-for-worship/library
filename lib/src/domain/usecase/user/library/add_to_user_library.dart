import 'dart:convert';

import 'package:collection/collection.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/id.dart';

class AddToUserLibrary {
  final HfwDatabase db;

  AddToUserLibrary(this.db);

  Future<void> call(
    String userId, {
    String hymnId = '',
    String topicId = '',
    String stakeholderId = '',
    String playlistId = '',
  }) async {
    final (key, id) = () {
      if (hymnId.isNotEmpty) {
        return ('hymn_id', hymnId);
      } else if (topicId.isNotEmpty) {
        return ('topic_id', topicId);
      } else if (stakeholderId.isNotEmpty) {
        return ('stakeholder_id', stakeholderId);
      } else if (playlistId.isNotEmpty) {
        return ('playlist_id', playlistId);
      }
      throw Exception('Invalid key');
    }();
    final items = await db.getUserLibrary(userId).get();
    final current = items.firstWhereOrNull((item) {
      final map = jsonDecode(item.data) as Map<String, dynamic>;
      return map.containsKey(key) && map[key] == id;
    });
    if (current != null) {
      if (current.deleted == true) {
        await db.undoDeleteRecordModel(current.id, 'user_library');
        await db.setSyncStatusRecordModel(false, current.id, 'user_library');
      }
      return;
    } else {
      final id = generateId();
      final now = DateTime.now();
      final map = <String, dynamic>{
        'id': id,
        'collectionId': 'user_library',
        'collectionName': 'user_library',
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
      await db.setSyncStatusRecordModel(false, id, 'user_library');
    }
  }
}
