import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../../data/source/pocketbase/client.dart';
import '../../../../data/source/pocketbase/get_records.dart';
import '../../../model/collection.dart';

class GetCollections extends GetRecords<Collection, void> {
  GetCollections({required super.db, required super.client})
      : super(
          collectionName: 'collections',
          itemFromRecordModel: (record) => record.toCollection(client),
          itemFromRecord: (record) =>
              RecordModel.fromJson(jsonDecode(record.data))
                  .toCollection(client),
          getRecords: (user) => db.getRecordModelsByCollection('collections'),
        );
}

extension CollectionRecordModelUtils on RecordModel {
  Collection toCollection(HfwStudio client) {
    final hymnalId = getStringValue('hymnal_id');
    final name = getStringValue('name');
    final alias = getStringValue('alias');
    final deleted = getBoolValue('deleted');
    final file = client.getFileUrl(this, getStringValue('file'));
    return Collection(
      id: id,
      hymnalId: hymnalId,
      name: name,
      alias: alias,
      file: file,
      deleted: deleted,
    );
  }
}
