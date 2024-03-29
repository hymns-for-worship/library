import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../data/source/database/database.dart';
import '../../../data/source/pocketbase/client.dart';
import '../../model/hymn_link.dart';
import 'get_hymn_links.dart';

class GetHymnLinksForHymn {
  final HfwDatabase db;
  final HfwStudio client;

  GetHymnLinksForHymn({required this.db, required this.client});

  Stream<List<HymnLink>> call(String hymnId) async* {
    final current = await db.getRecordModelsByCollection('hymn_links').get();
    final related = current
        .where((e) => e.deleted != true)
        .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
        .map((e) => e.toHymnLink())
        .where((e) => e.hymnId == hymnId)
        .toList();
    yield related;
    final status = await db
        .getCollectionSyncedStatus('hymn_links_$hymnId')
        .getSingleOrNull();
    final now = DateTime.now();
    const duration = Duration(days: 1);
    var needsUpdate = status == null || related.isEmpty;
    if (status != null) {
      needsUpdate = status.updated.add(duration).isBefore(now);
    }
    if (needsUpdate) {
      try {
        final remote = await client
            .collection('hymn_links')
            .getFullList(filter: "hymn_id = '$hymnId'");
        if (remote.isNotEmpty) {
          for (final item in remote) {
            await db.setRecordModel(
              jsonEncode(item.toJson()),
              true,
              false,
            );
          }
          await db.setCollectionSyncedStatus(
            'hymn_links_$hymnId',
            true,
            now,
            now,
          );
        }
      } catch (e) {
        // ignore: avoid_print
        print('error updating hymn_links for $hymnId: $e');
      }
    }

    final stream = db.getRecordModelsByCollection('hymn_links').watch();
    await for (final items in stream) {
      yield items
          .where((e) => e.deleted != true)
          .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
          .map((e) => e.toHymnLink())
          .where((e) => e.hymnId == hymnId)
          .toList();
    }
  }
}
