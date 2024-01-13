import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/pocketbase/client.dart';
import '../../../model/collection.dart';
import 'get_collection_hymns.dart';
import 'get_collections.dart';

class GetCollectionDetails {
  final HfwDatabase db;
  final HfwStudio client;

  GetCollectionDetails({required this.db, required this.client});

  Stream<(Collection?, List<HymnCollection>)> call(String collectionId) async* {
    final current = await db //
        .getRecordModelsByCollection('collections')
        .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
        .map((e) => e.toCollection(client))
        .get();
    final items = await db //
        .getRecordModelsByCollection('hymn_collections')
        .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
        .map((e) => e.toHymnCollection())
        .get();
    final collection = current
        .where((e) => e.deleted != true)
        .firstWhereOrNull((e) => e.id == collectionId);
    final related = items
        .where((e) => e.deleted != true)
        .where((e) => e.collectionId == collectionId)
        .toList();
    yield (collection, related);

    final status = await db
        .getCollectionSyncedStatus('collection_$collectionId')
        .getSingleOrNull();
    final now = DateTime.now();
    const duration = Duration(days: 1);
    var needsUpdate = status == null || related.isEmpty;
    if (status != null) {
      needsUpdate = status.updated.add(duration).isBefore(now);
    }
    if (needsUpdate) {
      try {
        final remote = await client.collection('hymn_collections').getFullList(
              filter: "collection_id = '$collectionId'",
              expand: 'collection_id',
            );
        if (remote.isNotEmpty) {
          for (final item in remote) {
            await db.setRecordModel(
              jsonEncode(item.toJson()),
              true,
              false,
            );
            final col = item.expand['collection_id']?.firstOrNull;
            if (col != null) {
              await db.setRecordModel(
                jsonEncode(col.toJson()),
                true,
                false,
              );
            }
          }
          await db.setCollectionSyncedStatus(
            'collection_$collectionId',
            true,
            now,
            now,
          );
        }
      } catch (e) {
        // ignore: avoid_print
        print('error updating collection for $collectionId: $e');
      }
    }

    final stream = db.getRecordModelsByCollection('hymn_collections').watch();
    await for (final items in stream) {
      final collections = await db
          .getRecordModelsByCollection('collections')
          .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
          .map((e) => e.toCollection(client))
          .get()
          .then((e) => e.where((e) => e.id == collectionId).toList());
      final related = items
          .where((e) => e.deleted != true)
          .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
          .map((e) => e.toHymnCollection())
          .where((e) => e.collectionId == collectionId)
          .toList();
      yield (collections.firstOrNull, related);
    }
  }
}
