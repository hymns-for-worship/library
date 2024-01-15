import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../data/source/database/database.dart';
import '../../../data/source/pocketbase/client.dart';
import '../../model/hymn_download.dart';

class GetHymnDownloads {
  final HfwDatabase db;
  final HfwStudio client;

  GetHymnDownloads({required this.db, required this.client});

  Stream<List<HymnDownload>> call() async* {
    final current = await db.getRecordModelsByCollection('bundles').get();
    final related = current
        .where((e) => e.deleted != true)
        .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
        .map((e) => e.toHymnDownload(client))
        .toList();
    yield related;
    final status = await db //
        .getCollectionSyncedStatus('bundles')
        .getSingleOrNull();
    final now = DateTime.now();
    const duration = Duration(days: 1);
    final newest = related.isEmpty
        ? null
        : related.length == 1
            ? related.first.updated
            : related
                .reduce((a, b) => a.updated.isAfter(b.updated) ? a : b)
                .updated;
    var needsUpdate = status == null || related.isEmpty;
    if (status != null) {
      needsUpdate = status.updated.add(duration).isBefore(now);
    }
    if (needsUpdate) {
      try {
        final remote = await client.collection('bundles').getFullList(
              filter: newest == null
                  ? null
                  : "updated > '${newest.toIso8601String()}'",
              expand: 'hymn_id',
            );
        if (remote.isNotEmpty) {
          for (final item in remote) {
            await db.setRecordModel(
              jsonEncode(item.toJson()),
              true,
              false,
            );
          }
          await db.setCollectionSyncedStatus(
            'bundles',
            true,
            now,
            now,
          );
        }
      } catch (e) {
        // ignore: avoid_print
        print('error updating bundles: $e');
      }
    }

    final stream = db.getRecordModelsByCollection('bundles').watch();
    await for (final items in stream) {
      yield items
          .where((e) => e.deleted != true)
          .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
          .map((e) => e.toHymnDownload(client))
          .toList();
    }
  }
}

extension HymnDownloadRecordModel on RecordModel {
  HymnDownload toHymnDownload(HfwStudio client) {
    final hymnId = getStringValue('hymn_id');
    final file = getStringValue('file');
    final hash = getStringValue('hash');
    final url = client.getFileUrl(this, file);
    final hymnRecordData = expand['hymn_id'] ?? [];
    final hymnRecord = hymnRecordData.firstOrNull;
    final hymnTitle = hymnRecord?.getStringValue('title') ?? 'N/A';
    final hymnNumber = hymnRecord?.getStringValue('number') ?? 'N/A';
    return HymnDownload(
      hymnId: hymnId,
      hymnTitle: hymnTitle,
      hymnNumber: hymnNumber,
      hymnalName: '',
      created: DateTime.parse(created),
      updated: DateTime.parse(updated),
      url: url,
      hash: hash,
      file: file,
    );
  }
}
