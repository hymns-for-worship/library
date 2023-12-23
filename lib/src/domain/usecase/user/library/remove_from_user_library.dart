import '../../../../data/source/database/database.dart';
import '../../../../data/source/pocketbase/client.dart';
import 'get_user_library.dart';

class RemoveFromUserLibrary {
  final HfwDatabase db;
  final HfwStudio client;

  RemoveFromUserLibrary({
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
      if (current.items.isEmpty) return;
      final id = current.items.first.id;
      await col.delete(id);
      await db.deleteRecordModelByCollectionNameAndId('user_library', id);
    } catch (error, stackTrace) {
      // ignore: avoid_print
      print('error removing from user library: $error $stackTrace');
      final item = await GetUserLibrary.find(
        db,
        user,
        hymnId: hymnId,
        topicId: topicId,
        stakeholderId: stakeholderId,
        playlistId: playlistId,
      );
      if (item != null) {
        await db.updateRecordModel(
          item.data,
          true,
          false,
          DateTime.now(),
          item.id,
        );
      }
    }
  }
}
