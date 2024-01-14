import 'dart:convert';

import '../../../../data/source/database/database.dart';
import '../../../model/playlist_item.dart';

class EditPartsPlaylistItem {
  final HfwDatabase db;
  const EditPartsPlaylistItem(this.db);

  Future<void> call(
    String userId,
    Playlist data,
    List<String> parts,
    PlaylistItem current,
  ) async {
    if (data.user != userId) {
      throw Exception('Not allowed to edit this playlist');
    }
    final map = jsonDecode(current.data) as Map<String, dynamic>;
    map['parts'] = parts;
    await db.setRecordModel(
      jsonEncode(map),
      false,
      false,
    );
  }
}
