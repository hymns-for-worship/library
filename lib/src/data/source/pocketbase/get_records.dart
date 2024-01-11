import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:pocketbase/pocketbase.dart';

import '../database/database.dart';
import 'client.dart';

class GetRecords<T, Args> {
  final HfwDatabase db;
  final HfwStudio client;
  final String collectionName;
  final Selectable<Record> Function(Args args) getRecords;
  final String? fields, expand;
  final String Function(Args args)? filter;
  final T Function(RecordModel record) itemFromRecordModel;
  final T Function(Record record) itemFromRecord;
  final Duration staleDuration;
  void Function()? _dispose;
  bool _subscribed = false;

  GetRecords({
    required this.db,
    required this.client,
    required this.collectionName,
    required this.itemFromRecordModel,
    required this.itemFromRecord,
    required this.getRecords,
    this.staleDuration = const Duration(days: 1),
    this.filter,
    this.fields,
    this.expand,
  });

  Future<void> subscribe() async {
    if (_subscribed) return;
    try {
      _dispose?.call();
      _dispose =
          await client.collection(collectionName).subscribe('*', (e) async {
        final item = e.record;
        switch (e.action) {
          case 'create':
            if (item != null) {
              await db.createRecordModel(
                item.id,
                item.collectionId,
                item.collectionName,
                jsonEncode(item.toJson()),
                false,
                true,
                DateTime.now(),
                DateTime.now(),
              );
            }
            break;
          case 'update':
            if (item != null) {
              await db.updateRecordModel(
                jsonEncode(item.toJson()),
                false,
                true,
                DateTime.now(),
                item.id,
                item.collectionName,
              );
            }
            break;
          case 'delete':
            if (item != null) {
              await db.updateRecordModel(
                jsonEncode(item.toJson()),
                true,
                true,
                DateTime.now(),
                item.id,
                item.collectionName,
              );
            }
            break;
          default:
        }
      });
      _subscribed = true;
    } catch (error, stackTrace) {
      // ignore: avoid_print
      print('error subscribing to $collectionName $error $stackTrace');
      _subscribed = false;
    }
  }

  void dispose() {
    _dispose?.call();
    _dispose = null;
  }

  Stream<double> checkForUpdate(Args args, {bool force = false}) async* {
    final status = await db //
        .getCollectionSyncedStatus(collectionName)
        .getSingleOrNull();
    final now = DateTime.now();
    final target = now.subtract(staleDuration);
    final isStale = status?.updated.isAfter(target) ?? true;
    final needsFetch = status == null || !status.synced || isStale || force;
    if (status != null && !force) {
      yield 1;
      return;
    }
    if (needsFetch) {
      ResultList<RecordModel>? records;
      try {
        int page = 0;
        int totalPages = 1;
        const pageSize = 100;
        while (page < totalPages) {
          yield page / totalPages;
          final result = await client.collection(collectionName).getList(
                expand: expand,
                page: ++page,
                perPage: pageSize,
                fields: fields,
                filter: filter?.call(args),
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
              true,
              now,
              now,
            );
          }
        }
        await db.deleteRecordModelsByCollectionBeforeDate(
          collectionName,
          now,
        );
        await db.setCollectionSyncedStatus(collectionName, true, now, now);
      } catch (e) {
        // ignore: avoid_print
        print('error getting $collectionName: $e');
      }
      yield 1;
    }
  }

  Stream<List<T>> call(Args args, {bool check = true}) async* {
    if (check) await checkForUpdate(args).last;
    yield* getRecords(args).map(itemFromRecord).watch();
  }
}
