import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import 'database.dart';

extension HfwDatabaseX on HfwDatabase {
  Future<void> saveRecordModel(RecordModel model) async {
    final existing = await getRecordModelByCollectionName(
      model.collectionName,
      model.id,
    ).getSingleOrNull();
    if (existing == null) {
      await createRecordModel(
        model.id,
        model.collectionId,
        model.collectionName,
        jsonEncode(model.toJson()),
        false,
        true,
        DateTime.now(),
        DateTime.now(),
      );
    } else {
      await updateRecordModel(
        jsonEncode(model.toJson()),
        false,
        true,
        DateTime.now(),
        model.id,
      );
    }
  }
}
