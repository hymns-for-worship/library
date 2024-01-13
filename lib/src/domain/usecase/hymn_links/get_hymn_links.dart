import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../data/source/pocketbase/get_records.dart';
import '../../model/hymn_link.dart';

class GetHymnLinks extends GetRecords<HymnLink, void> {
  GetHymnLinks({required super.db, required super.client})
      : super(
          collectionName: 'hymn_links',
          itemFromRecordModel: (record) => record.toHymnLink(),
          itemFromRecord: (record) =>
              RecordModel.fromJson(jsonDecode(record.data)).toHymnLink(),
          getRecords: (user) => db.getRecordModelsByCollection('hymn_links'),
        );
}

extension HymnLinkRecordModel on RecordModel {
  HymnLink toHymnLink() {
    final hymnId = getStringValue('hymn_id');
    final name = getStringValue('name');
    final description = getStringValue('description');
    final author = getStringValue('author');
    final url = Uri.tryParse(getStringValue('url'));
    return HymnLink(
      hymnId: hymnId,
      name: name,
      description: description,
      url: url,
      author: author,
    );
  }
}
