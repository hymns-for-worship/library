import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:pocketbase/pocketbase.dart';

import '../../utils/retry/future.dart';
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
                jsonEncode(item.toJson()),
                true,
              );
            }
            break;
          case 'update':
            if (item != null) {
              await db.updateRecordModel(
                jsonEncode(item.toJson()),
                true,
                item.id,
                item.collectionName,
              );
            }
            break;
          case 'delete':
            if (item != null) {
              await db.updateRecordModel(
                jsonEncode({
                  ...item.toJson(),
                  'deleted': true,
                }),
                true,
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

  Stream<double> checkForUpdate(
    Args args, {
    bool force = false,
  }) async* {
    final status = await db //
        .getCollectionSyncedStatus(collectionName)
        .getSingleOrNull();
    final local = await db //
        .getRecordModelsByCollection(collectionName)
        .get();
    final now = DateTime.now();
    final target = now.subtract(staleDuration);
    final isStale = status?.updated.isAfter(target) ?? true;
    final needsFetch = status == null || !status.synced || isStale || force;
    if (status != null && !force && local.isNotEmpty) {
      await null;
      yield 1;
      return;
    }
    if (needsFetch || local.isEmpty) {
      ResultList<RecordModel>? records;
      try {
        int page = 0;
        int totalPages = 1;
        const pageSize = 100;
        while (page < totalPages) {
          yield page / totalPages;
          await retryFuture(() async {
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
      yield 1;
    }
  }

  bool checking = false;

  Stream<List<T>> call(
    Args args, {
    bool check = true,
    bool incremental = false,
  }) async* {
    if (check && !checking) {
      checking = true;
      checkForUpdate(args).listen((_) {});
    }
    yield* getRecords(args).map(itemFromRecord).watch();
  }
}
