import 'package:drift/drift.dart';

import '../../../../data/source/database/database.dart';

class GetPlaylists {
  final HfwDatabase db;

  GetPlaylists(this.db);

  Selectable<Playlist> call(String userId) {
    return db.getPlaylists(userId);
  }
}
