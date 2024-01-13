import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../../data/source/pocketbase/client.dart';
import '../../../../data/source/pocketbase/get_records.dart';
import '../../../model/collection.dart';

class GetHymnCollections extends GetRecords<HymnCollection, void> {
  GetHymnCollections({required super.db, required super.client})
      : super(
          collectionName: 'hymn_collections',
          itemFromRecordModel: (record) => _map(client, record),
          itemFromRecord: (record) =>
              _map(client, RecordModel.fromJson(jsonDecode(record.data))),
          getRecords: (user) =>
              db.getRecordModelsByCollection('hymn_collections'),
        );

  static HymnCollection _map(HfwStudio client, RecordModel record) {
    final title = record.getStringValue('title');
    final number = record.getStringValue('number');
    final collectionId = record.getStringValue('collection_id');
    final hymnId = record.getStringValue('hymn_id');
    return HymnCollection(
      id: record.id,
      title: title,
      number: number,
      collectionId: collectionId,
      hymnId: hymnId,
    );
  }
}
