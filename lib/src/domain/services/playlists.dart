import '../../data/source/database/database.dart';
import '../model/playlist.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../data/source/pocketbase/offline_first_records.dart';

class PlaylistsService extends RecordService
    with OfflineFirstRecords<Playlist> {
  PlaylistsService(this.db, PocketBase client, this.collection)
      : super(client, collection);

  @override
  final HfwDatabase db;

  @override
  final String collection;

  @override
  Playlist itemFromModel(RecordModel model) => model.toPlaylist();

  @override
  RecordModel modelFromItem(Playlist item) => item.toRecordModel();
}
