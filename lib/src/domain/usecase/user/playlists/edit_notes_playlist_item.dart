import 'dart:convert';

import '../../../../data/source/database/database.dart';
import '../../../model/playlist_item.dart';

class EditNotesPlaylistItem {
  final HfwDatabase db;
  const EditNotesPlaylistItem(this.db);

  Future<void> call(
    String userId,
    Playlist data,
    String text,
    PlaylistItem current,
  ) async {
    if (data.user != userId) {
      throw Exception('Not allowed to edit this playlist');
    }
    final map = jsonDecode(current.data) as Map<String, dynamic>;
    map['notes'] = text;
    await db.setRecordModel(
      jsonEncode(map),
      false,
      false,
    );
  }
}
