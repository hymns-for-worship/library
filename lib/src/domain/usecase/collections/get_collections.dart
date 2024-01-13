import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../data/source/pocketbase/client.dart';
import '../../../data/source/pocketbase/get_records.dart';
import '../../model/collection.dart';

class GetCollections extends GetRecords<Collection, void> {
  GetCollections({required super.db, required super.client})
      : super(
          collectionName: 'collections',
          itemFromRecordModel: (record) => _map(client, record),
          itemFromRecord: (record) =>
              _map(client, RecordModel.fromJson(jsonDecode(record.data))),
          getRecords: (user) => db.getRecordModelsByCollection('collections'),
        );

  static Collection _map(HfwStudio client, RecordModel record) {
    final hymnalId = record.getStringValue('hymnal_id');
    final name = record.getStringValue('name');
    final alias = record.getStringValue('alias');
    final file = client.getFileUrl(record, record.getStringValue('file'));
    return Collection(
      id: record.id,
      hymnalId: hymnalId,
      name: name,
      alias: alias,
      file: file,
    );
  }
}
