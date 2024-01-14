import '../../../../data/source/database/database.dart';
import '../../../model/playlist_item.dart';

class RemovePlaylistItem {
  final HfwDatabase db;
  const RemovePlaylistItem(this.db);

  Future<void> call(
    String userId,
    Playlist data,
    PlaylistItem item,
  ) async {
    if (data.user != userId) {
      throw Exception('Not allowed to edit this playlist');
    }
    await db.deleteRecordModel(item.id, item.collectionName);
    await db.setSyncStatusRecordModel(false, item.id, item.collectionName);
  }
}
