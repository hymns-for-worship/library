import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' show MultipartFile;
import 'package:pocketbase/pocketbase.dart';

import '../database/database.dart';

mixin OfflineFirstRecords<T> on RecordService {
  HfwDatabase get db;
  T itemFromModel(RecordModel model);
  RecordModel modelFromItem(T item);
  Stream<List<T>> get stream => _controller.stream;
  final _controller = StreamController<List<T>>.broadcast();
  StreamSubscription? _subscription;
  Future<void> Function()? _cleanup;
  Timer? _debounce;
  static const _local = 'X-Local';
  String get collection;
  bool subscribed = false;

  Future<void> init({bool fetchAll = true}) async {
    _subscription = db //
        .getRecordModelsByCollection(collection)
        .watch()
        .listen((e) async {
      final items = e.map(_recordToModel).map(itemFromModel).toList();
      _controller.add(items);
      _debounce?.cancel();
      _debounce = Timer(const Duration(seconds: 1), _sync);
    });
    await retrySubscription();
    try {
      if (fetchAll) await getFullList();
    } catch (e, t) {
      if (kDebugMode) {
        print('Error fetching full list: $e $t');
      }
    }
  }

  Future<void> retrySubscription() async {
    if (!subscribed) {
      try {
        _cleanup = await subscribe('*', onRecordEvent);
        subscribed = true;
      } catch (e, t) {
        if (kDebugMode) {
          print('Error subscribing to record events: $e $t');
        }
      }
    }
  }

  Future<void> dispose() async {
    await _subscription?.cancel();
    await _cleanup?.call();
    await _controller.close();
    subscribed = false;
  }

  Future<void> onRecordEvent(RecordSubscriptionEvent e) async {
    final record = e.record;
    switch (e.action) {
      case 'create':
      case 'update':
        if (record != null) {
          await save(itemFromModel(record), true);
        }
        break;
      case 'delete':
        if (record != null) {
          await db.deleteRecordModel(record.id, collection);
        }
        break;
      default:
    }
  }

  Future<void> save(T record, bool synced) async {
    final model = modelFromItem(record);
    final existing = await db //
        .getRecordModelByCollection(collection, model.id)
        .getSingleOrNull();
    if (existing != null) {
      // update existing record
      await db.updateRecordModel(
        jsonEncode(model.toJson()),
        synced,
        model.id,
        collection,
      );
    } else {
      // insert new record
      await db.createRecordModel(
        jsonEncode(model.toJson()),
        synced,
      );
    }
  }

  Future<void> _sync() async {
    final records = await db.getRecordModelsByCollection(collection).get();
    final unsynced = records.where((e) => e.synced != true).toList();
    for (final record in unsynced) {
      final model = _recordToModel(record);
      try {
        if (record.fresh == true) {
          await create(
            body: model.toJson(),
            headers: {_local: 'true'},
          );
        } else {
          await update(
            record.id,
            body: model.toJson(),
            headers: {_local: 'true'},
          );
        }
      } catch (e, t) {
        if (kDebugMode) {
          print('Error syncing record: ${model.id}|$collection $e $t');
        }
      }
    }
  }

  RecordModel _recordToModel(Record record) {
    return RecordModel.fromJson(jsonDecode(record.data));
  }

  @override
  Future<RecordModel> create({
    Map<String, dynamic> body = const {},
    Map<String, dynamic> query = const {},
    List<MultipartFile> files = const [],
    Map<String, String> headers = const {},
    String? expand,
    String? fields,
  }) async {
    final local = headers[_local] == 'true';
    try {
      final model = await super.create(
        body: body,
        query: query,
        files: files,
        headers: headers,
        expand: expand,
        fields: fields,
      );
      await save(itemFromModel(model), true);
      return model;
    } catch (e) {
      if (!local) {
        await save(itemFromModel(RecordModel.fromJson(body)), false);
      }
      rethrow;
    }
  }

  @override
  Future<RecordModel> update(
    String id, {
    Map<String, dynamic> body = const {},
    Map<String, dynamic> query = const {},
    List<MultipartFile> files = const [],
    Map<String, String> headers = const {},
    String? expand,
    String? fields,
  }) async {
    final local = headers[_local] == 'true';
    try {
      final model = await super.update(
        id,
        body: body,
        query: query,
        files: files,
        headers: headers,
        expand: expand,
        fields: fields,
      );
      await save(itemFromModel(model), true);
      return model;
    } catch (e) {
      if (!local) {
        await save(itemFromModel(RecordModel.fromJson(body)), false);
      }
      rethrow;
    }
  }

  @override
  Future<void> delete(
    String id, {
    Map<String, dynamic> body = const {},
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    final local = headers[_local] == 'true';
    try {
      await super.delete(
        id,
        body: body,
        query: query,
        headers: headers,
      );
      await db.deleteRecordModelByCollectionAndId(collection, id);
    } catch (e) {
      if (!local) {
        await db.deleteRecordModel(id, collection);
        await db.setSyncStatusRecordModel(false, id, collection);
      }
      rethrow;
    }
  }

  Future<RecordModel?> getOneOrNull(
    String id, {
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
    String? expand,
    String? fields,
  }) async {
    try {
      return await super.getOne(
        id,
        query: query,
        headers: headers,
        expand: expand,
        fields: fields,
      );
    } catch (e, t) {
      if (kDebugMode) {
        print('Error getting record: $id|$collection $e $t');
      }
      return null;
    }
  }

  @override
  Future<List<RecordModel>> getFullList({
    int batch = 500,
    String? expand,
    String? filter,
    String? sort,
    String? fields,
    Map<String, dynamic> query = const {},
    Map<String, String> headers = const {},
  }) async {
    final items = await super.getFullList(
      batch: batch,
      expand: expand,
      filter: filter,
      sort: sort,
      fields: fields,
      query: query,
      headers: headers,
    );
    if (filter == null && fields == null) {
      await db.transaction(() async {
        await db.deleteRecordModelByCollection(collection);
        for (final item in items) {
          await db.createRecordModel(
            jsonEncode(item.toJson()),
            true,
          );
        }
      });
    }
    return items;
  }
}
