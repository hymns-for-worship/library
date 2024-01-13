import 'package:collection/collection.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/pocketbase/client.dart';
import '../../../model/collection.dart';
import 'get_collection_hymns.dart';
import 'get_collections.dart';

class GetCollectionForHymn {
  final HfwDatabase db;
  final HfwStudio client;

  GetCollectionForHymn({required this.db, required this.client});

  late final getCollections = GetCollections(db: db, client: client);
  late final getHymnCollections = GetHymnCollections(db: db, client: client);

  Stream<List<Collection>> call(String hymnId) {
    final collections = getCollections(null);
    final items = getHymnCollections(null);
    return collections.combineLatest(items, (collections, items) {
      final related = items.where((i) => i.collectionId == hymnId).toList();
      final results = <Collection>[];
      for (final item in related) {
        final collection = collections.firstWhereOrNull((c) => c.id == item.id);
        if (collection != null) {
          results.add(collection);
        }
      }
      return results;
    });
  }
}
