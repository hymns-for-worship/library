import '../../../../data/source/database/database.dart';

class DeletePlaylist {
  final HfwDatabase db;
  const DeletePlaylist(this.db);

  Future<void> call(String id, {bool restore = false}) async {
    if (restore) {
      await db.undoDeleteRecordModel(id, 'playlists');
    } else {
      await db.deleteRecordModel(id, 'playlists');
    }
    await db.setSyncStatusRecordModel(false, id, 'playlists');
  }
}
