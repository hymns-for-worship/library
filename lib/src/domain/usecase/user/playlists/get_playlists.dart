import 'package:drift/drift.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/pocketbase/client.dart';

class GetPlaylists {
  final HfwStudio client;
  final HfwDatabase db;
  final String collectionName;
  late final collection = client.collection(collectionName);

  GetPlaylists({
    required this.client,
    required this.db,
    this.collectionName = 'playlists',
  });

  Selectable<Playlist> call(String userId) {
    print('get playlists, $userId');
    return db.getPlaylists(userId);
  }
}
