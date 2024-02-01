import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../data/source/database/database.dart';
import '../../../data/source/pocketbase/client.dart';
import '../../../data/utils/retry/future.dart';
import '../../model/hymn_download.dart';

class GetHymnDownloads {
  final HfwDatabase db;
  final HfwStudio client;
  static String collection = 'hymns';

  GetHymnDownloads({required this.db, required this.client});

  Stream<List<HymnDownload>> call({void Function(double)? progress}) async* {
    final current = await db.getRecordModelsByCollection(collection).get();
    final related = current
        .where((e) => e.deleted != true)
        .map((e) => RecordModel.fromJson(jsonDecode(e.data)))
        .map((e) => e.toHymnDownload(client))
        .toList();
    yield related;
    final status = await db //
        .getCollectionSyncedStatus(collection)
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
      progress?.call(0.1);
      final stream = client.getFullListWithProgress(
        db,
        client,
        collection,
        filter:
            newest == null ? null : "updated > '${newest.toIso8601String()}'",
      );
      await for (final (event, items) in stream) {
        progress?.call(event);
        yield items.map((e) => e.toHymnDownload(client)).toList();
      }
      progress?.call(1);
    }

    final stream = db.getRecordModelsByCollection(collection).watch();
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
  // TODO: Convert to download link for query hymns only
  HymnDownload toHymnDownload(HfwStudio client) {
    final hymnId = id;
    final hymnTitle = getStringValue('title');
    final hymnNumber = getStringValue('number');
    final downloadLink = getStringValue('download_link');
    final downloadHash = getStringValue('download_hash');
    final url = Uri.parse(downloadLink);
    final hash = downloadHash;
    return HymnDownload(
      hymnId: hymnId,
      hymnTitle: hymnTitle,
      hymnNumber: hymnNumber,
      hymnalName: '',
      created: DateTime.parse(created),
      updated: DateTime.parse(updated),
      url: url,
      hash: hash,
    );
  }
}

extension on HfwStudio {
  Stream<(double, List<RecordModel>)> getFullListWithProgress(
    HfwDatabase db,
    HfwStudio client,
    String collectionName, {
    String? expand,
    String? filter,
    String? fields,
  }) async* {
    ResultList<RecordModel>? records;
    final now = DateTime.now();
    try {
      int page = 0;
      int totalPages = 1;
      const pageSize = 100;
      while (page < totalPages) {
        yield (page / totalPages, records?.items ?? []);
        await retryFuture(() async {
          final result = await client.collection(collectionName).getList(
                expand: expand,
                page: ++page,
                perPage: pageSize,
                fields: fields,
                filter: filter,
              );
          if (records == null) {
            records = result;
            totalPages = result.totalPages;
          } else {
            records = ResultList<RecordModel>(
              items: [...records!.items, ...result.items],
              page: result.page,
              perPage: pageSize,
              totalItems: result.totalItems,
              totalPages: result.totalPages,
            );
            totalPages = result.totalPages;
          }
          for (final record in result.items) {
            await db.setRecordModel(
              jsonEncode({
                ...record.toJson(),
                '_date': now.toIso8601String(),
              }),
              true,
              false,
            );
          }
        });
      }
      final local = await db //
          .getRecordModelsByCollection(collectionName)
          .get();
      for (final item in local) {
        final map = jsonDecode(item.data) as Map<String, dynamic>;
        if (map['_date'] != now.toIso8601String()) {
          await db.deleteRecordModelByCollectionAndId(
            item.collectionName,
            item.id,
          );
        }
      }
      await db.setCollectionSyncedStatus(collectionName, true, now, now);
    } catch (e) {
      // ignore: avoid_print
      print('error getting $collectionName: $e');
    }
    yield (1, records?.items ?? []);
  }
}
