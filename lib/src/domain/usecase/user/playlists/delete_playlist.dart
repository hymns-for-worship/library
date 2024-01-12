import '../../../../data/source/database/database.dart';

class DeletePlaylist {
  final HfwDatabase db;
  const DeletePlaylist(this.db);

  Future<Playlist> call(Playlist data) async {
    final now = DateTime.now();
    final playlist = data.copyWith(
      synced: false,
      updated: now,
    );
    await db.createRecordModel(
      playlist.toJsonString(),
      playlist.synced,
    );
    final items = await db.getItemsForPlaylist(data.user, data.id).get();
    for (var item in items) {
      item = item.copyWith(
        synced: false,
        updated: now,
      );
      await db.createRecordModel(
        item.toJsonString(),
        item.synced,
      );
    }
    return playlist;
  }
}
