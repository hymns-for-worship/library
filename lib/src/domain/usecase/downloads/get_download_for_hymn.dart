import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../data/source/database/database.dart';
import '../../../data/source/pocketbase/client.dart';
import '../../model/hymn_download.dart';
import 'get_downloads.dart';

class GetHymnDownloadForHymn {
  final HfwDatabase db;
  final HfwStudio client;

  GetHymnDownloadForHymn({required this.db, required this.client});

  Stream<HymnDownload?> call(String hymnId) async* {
    final current =
        await db.getRecordModelsByCollection(GetHymnDownloads.collection).get();
    final related = current
        .where((e) => e.deleted != true)
        .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
        .map((e) => e.toHymnDownload(client))
        .where((e) => e.hymnId == hymnId)
        .toList();
    yield related.firstOrNull;
    final status = await db //
        .getCollectionSyncedStatus('${GetHymnDownloads.collection}_$hymnId')
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
            .collection(GetHymnDownloads.collection)
            .getFullList(filter: "id = '$hymnId'");
        if (remote.isNotEmpty) {
          for (final item in remote) {
            await db.setRecordModel(
              jsonEncode(item.toJson()),
              true,
              false,
            );
          }
          await db.setCollectionSyncedStatus(
            '${GetHymnDownloads.collection}_$hymnId',
            true,
            now,
            now,
          );
        }
      } catch (e) {
        // ignore: avoid_print
        print('error updating ${GetHymnDownloads.collection} for $hymnId: $e');
      }
    }

    final stream =
        db.getRecordModelsByCollection(GetHymnDownloads.collection).watch();
    await for (final items in stream) {
      yield items
          .where((e) => e.deleted != true)
          .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
          .map((e) => e.toHymnDownload(client))
          .where((e) => e.hymnId == hymnId)
          .toList()
          .firstOrNull;
    }
  }
}
