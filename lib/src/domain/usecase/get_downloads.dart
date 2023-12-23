import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../data/source/database/database.dart';
import '../../data/source/pocketbase/client.dart';
import '../model/hymn_download.dart';

class GetDownloads {
  final HfwStudio client;
  final HfwDatabase db;
  final staleDuration = const Duration(days: 1);

  GetDownloads(this.client, this.db);

  Stream<List<HymnDownload>> call() async* {
    const collectionName = 'bundles';
    final status = await db //
        .getCollectionNameSyncedStatus(collectionName)
        .getSingleOrNull();
    final now = DateTime.now();
    final target = now.subtract(staleDuration);
    final isStale = status?.updated.isAfter(target) ?? true;
    final needsFetch = status == null || !status.synced || isStale;
    if (status != null) yield await _getDownloads().get();
    if (needsFetch) {
      ResultList<RecordModel>? records;
      try {
        int page = 0;
        int totalPages = 1;
        const pageSize = 100;
        while (page < totalPages) {
          final result = await client.collection(collectionName).getList(
                expand: 'hymn_id',
                page: ++page,
                perPage: pageSize,
                fields:
                    'id,created,updated,hash,file,hymn_id,expand.hymn_id.title,expand.hymn_id.number',
              );
          if (records == null) {
            records = result;
            totalPages = result.totalPages;
          } else {
            records = ResultList<RecordModel>(
              items: [...records.items, ...result.items],
              page: result.page,
              perPage: pageSize,
              totalItems: result.totalItems,
              totalPages: result.totalPages,
            );
            totalPages = result.totalPages;
          }
          for (final record in result.items) {
            await db.createRecordModel(
              record.id,
              record.collectionId,
              record.collectionName,
              jsonEncode(record.toJson()),
              false,
              false,
              now,
              now,
            );
          }
          if (status == null) yield await _getDownloads().get();
        }
        await db.deleteRecordModelsByCollectionNameBeforeDate(
          collectionName,
          now,
        );
        await db.setCollectionSyncedStatus(collectionName, true, now, now);
      } catch (e) {
        // ignore: avoid_print
        print('error getting $collectionName: $e');
      }
    }
    yield* _getDownloads().watch();
  }

  Selectable<HymnDownload> _getDownloads() {
    return db.getRecordModelByCollectionName('bundles').map((r) {
      final data = jsonDecode(r.data);
      final record = RecordModel.fromJson(data);
      final hymnId = record.getStringValue('hymn_id');
      final file = record.getStringValue('file');
      final hash = record.getStringValue('hash');
      final url = client.getFileUrl(record, file);
      final hymnRecord = record.expand['hymn_id']!.first;
      final hymnTitle = hymnRecord.getStringValue('title');
      final hymnNumber = hymnRecord.getStringValue('number');
      final created = DateTime.parse(record.created);
      final updated = DateTime.parse(record.updated);
      return HymnDownload(
        hymnId: hymnId,
        hymnTitle: hymnTitle,
        hymnNumber: hymnNumber,
        created: created,
        updated: updated,
        url: url,
        hash: hash,
        file: file,
      );
    });
  }
}
