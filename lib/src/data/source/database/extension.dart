import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import 'database.dart';

extension HfwDatabaseX on HfwDatabase {
  Future<void> saveRecordModel(
    RecordModel model, {
    bool deleted = false,
    bool synced = true,
  }) async {
    final existing = await getRecordModelByCollection(
      model.collectionName,
      model.id,
    ).getSingleOrNull();
    final now = DateTime.now();
    final str = jsonEncode(model.toJson());
    if (existing == null) {
      await createRecordModel(
        model.id,
        model.collectionId,
        model.collectionName,
        str,
        deleted,
        synced,
        now,
        now,
      );
    } else {
      await updateRecordModel(
        str,
        deleted,
        synced,
        now,
        model.id,
        model.collectionName,
      );
    }
  }
}
