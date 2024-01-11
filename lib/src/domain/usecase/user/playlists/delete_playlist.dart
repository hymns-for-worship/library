import '../../../../data/source/database/database.dart';

class DeletePlaylist {
  final HfwDatabase db;
  const DeletePlaylist(this.db);

  Future<Playlist> call(Playlist data) async {
    final now = DateTime.now();
    final playlist = data.copyWith(
      deleted: true,
      synced: false,
      updated: now,
    );
    await db.createRecordModel(
      playlist.id,
      playlist.collectionId,
      playlist.collectionName,
      playlist.toJsonString(),
      playlist.deleted,
      playlist.synced,
      playlist.created,
      playlist.updated,
    );
    return playlist;
  }
}
