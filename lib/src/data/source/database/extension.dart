import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import 'database.dart';

extension HfwDatabaseX on HfwDatabase {
  Future<void> saveRecordModel(
    RecordModel model, {
    bool synced = true,
  }) async {
    final existing = await getRecordModelByCollection(
      model.collectionName,
      model.id,
    ).getSingleOrNull();
    if (existing == null) {
      await createRecordModel(
        jsonEncode(model.toJson()),
        synced,
      );
    } else {
      await updateRecordModel(
        jsonEncode(model.toJson()),
        synced,
        model.id,
        model.collectionName,
      );
    }
  }
}
