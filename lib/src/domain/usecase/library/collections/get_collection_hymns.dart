import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../../data/source/pocketbase/get_records.dart';
import '../../../model/collection.dart';

class GetHymnCollections extends GetRecords<HymnCollection, void> {
  GetHymnCollections({required super.db, required super.client})
      : super(
          collectionName: 'hymn_collections',
          itemFromRecordModel: (record) => record.toHymnCollection(),
          itemFromRecord: (record) =>
              RecordModel.fromJson(jsonDecode(record.data)).toHymnCollection(),
          getRecords: (user) =>
              db.getRecordModelsByCollection('hymn_collections'),
        );
}

extension HymnCollectionRecordModelUtils on RecordModel {
  HymnCollection toHymnCollection() {
    final title = getStringValue('title');
    final number = getStringValue('number');
    final collectionId = getStringValue('collection_id');
    final hymnId = getStringValue('hymn_id');
    final deleted = getBoolValue('deleted');
    return HymnCollection(
      id: id,
      title: title,
      number: number,
      collectionId: collectionId,
      hymnId: hymnId,
      deleted: deleted,
    );
  }
}
