import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/pocketbase/client.dart';
import '../../../model/collection.dart';
import 'get_collection_hymns.dart';
import 'get_collections.dart';

class GetCollectionForHymn {
  final HfwDatabase db;
  final HfwStudio client;

  GetCollectionForHymn({required this.db, required this.client});

  Stream<List<(HymnCollection, Collection?)>> call(String hymnId) async* {
    final current =
        await db.getRecordModelsByCollection('hymn_collections').get();
    final currentCollections = await db
        .getRecordModelsByCollection('collections')
        .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
        .map((e) => e.toCollection(client))
        .get();
    final related = current
        .where((e) => e.deleted != true)
        .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
        .map((e) => e.toHymnCollection())
        .where((e) => e.hymnId == hymnId)
        .map((e) {
      final col = currentCollections.firstWhereOrNull((c) => c.id == e.id);
      return (e, col);
    }).toList();
    yield related;
    final status = await db
        .getCollectionSyncedStatus('hymn_collections_$hymnId')
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
              filter: "hymn_id = '$hymnId'",
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
            'hymn_collections_$hymnId',
            true,
            now,
            now,
          );
        }
      } catch (e) {
        // ignore: avoid_print
        print('error updating hymn_collections for $hymnId: $e');
      }
    }

    final stream = db.getRecordModelsByCollection('hymn_collections').watch();
    await for (final items in stream) {
      final currentCollections = await db
          .getRecordModelsByCollection('collections')
          .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
          .map((e) => e.toCollection(client))
          .get();
      yield items
          .where((e) => e.deleted != true)
          .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
          .map((e) => e.toHymnCollection())
          .where((e) => e.hymnId == hymnId)
          .map((e) {
        final col = currentCollections.firstWhereOrNull((c) => c.id == e.id);
        return (e, col);
      }).toList();
    }
  }
}
