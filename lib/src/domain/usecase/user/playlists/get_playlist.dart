// ignore_for_file: no_leading_underscores_for_local_identifiers

import '../../../../data/source/database/database.dart';

import 'package:stream_transform/stream_transform.dart';

import '../../../model/playlist_item.dart';

typedef PlaylistResult = (Playlist?, List<PlaylistItem>);

class GetPlaylist {
  final HfwDatabase db;

  GetPlaylist(this.db);

  Stream<PlaylistResult> call(String id, String userId) async* {
    final playlist = db.getPlaylistByUserAndId(userId, id);
    final items = db.getPlaylistItemsForPlaylist(id);
    yield* playlist
        .watchSingleOrNull()
        .combineLatest(items, (playlist, items) => (playlist, items));
  }
}
