// ignore_for_file: no_leading_underscores_for_local_identifiers

import '../../../../data/source/database/database.dart';

import 'package:stream_transform/stream_transform.dart';

typedef PlaylistResult = (Playlist?, List<PlaylistItem>);

class GetPlaylist {
  final HfwDatabase db;

  GetPlaylist(this.db);

  Stream<PlaylistResult> call(String id, String userId) async* {
    final playlist = db.getPlaylistByUserAndId(userId, id);
    final items = db.getPlaylistItemsByUserAndPlaylistId(userId, id);
    yield* playlist
        .watchSingleOrNull()
        .combineLatest(items.watch(), (playlist, items) => (playlist, items));
  }
}
