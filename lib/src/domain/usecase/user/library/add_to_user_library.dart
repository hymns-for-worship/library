import 'dart:convert';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/pocketbase/client.dart';
import 'get_user_library.dart';

class AddToUserLibrary {
  final HfwDatabase db;
  final HfwStudio client;

  AddToUserLibrary({
    required this.db,
    required this.client,
  });

  Future<void> call(
    String user, {
    String? hymnId,
    String? topicId,
    String? stakeholderId,
    String? playlistId,
  }) async {
    final col = client.collection('user_library');
    try {
      final filter = StringBuffer("user = '$user'");
      if (hymnId != null) {
        filter.write(" && hymn_id = '$hymnId'");
      } else if (topicId != null) {
        filter.write(" && topic_id = '$topicId'");
      } else if (stakeholderId != null) {
        filter.write(" && stakeholder_id = '$stakeholderId'");
      } else if (playlistId != null) {
        filter.write(" && playlist_id = '$playlistId'");
      }
      final current = await col.getList(filter: filter.toString());
      if (current.items.isNotEmpty) return;
      final result = await col.create(body: {
        'user': user,
        if (hymnId != null) 'hymn_id': hymnId,
        if (topicId != null) 'topic_id': topicId,
        if (stakeholderId != null) 'stakeholder_id': stakeholderId,
        if (playlistId != null) 'playlist_id': playlistId,
      });
      final item = await GetUserLibrary.find(
        db,
        user,
        hymnId: hymnId,
        topicId: topicId,
        stakeholderId: stakeholderId,
        playlistId: playlistId,
      );
      if (item == null) {
        await db.createRecordModel(
          result.id,
          result.collectionId,
          result.collectionName,
          jsonEncode(result.toJson()),
          false,
          true,
          DateTime.now(),
          DateTime.now(),
        );
      }
    } catch (error, stackTrace) {
      // ignore: avoid_print
      print('error adding to user library: $error $stackTrace');
    }
  }
}