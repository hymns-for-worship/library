import 'package:collection/collection.dart';
import 'package:stream_transform/stream_transform.dart';

import '../../../data/source/database/database.dart';
import '../../../data/source/pocketbase/client.dart';
import '../../model/collection.dart';
import 'get_collection_hymns.dart';
import 'get_collections.dart';

typedef CollectionDetails = ({
  Collection? collection,
  List<HymnCollection> items,
});

class GetCollection {
  final HfwDatabase db;
  final HfwStudio client;

  GetCollection({required this.db, required this.client});

  late final getCollections = GetCollections(db: db, client: client);
  late final getHymnCollections = GetHymnCollections(db: db, client: client);

  Stream<CollectionDetails> call(String id) {
    final collections = getCollections(id);
    final items = getHymnCollections(id);
    return collections.combineLatest(items, (collections, items) {
      final collection = collections.isEmpty
          ? null
          : collections.firstWhereOrNull((c) => c.id == id);
      final related = items.where((i) => i.collectionId == id).toList();
      return (
        collection: collection,
        items: related,
      );
    });
  }
}
