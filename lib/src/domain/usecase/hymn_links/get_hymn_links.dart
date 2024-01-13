import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../data/source/pocketbase/client.dart';
import '../../../data/source/pocketbase/get_records.dart';
import '../../model/hymn_link.dart';

class GetHymnLinks extends GetRecords<HymnLink, void> {
  GetHymnLinks({required super.db, required super.client})
      : super(
          collectionName: 'hymn_links',
          itemFromRecordModel: (record) => _map(client, record),
          itemFromRecord: (record) =>
              _map(client, RecordModel.fromJson(jsonDecode(record.data))),
          getRecords: (user) => db.getRecordModelsByCollection('hymn_links'),
        );

  static HymnLink _map(HfwStudio client, RecordModel record) {
    final hymnId = record.getStringValue('hymn_id');
    final name = record.getStringValue('name');
    final description = record.getStringValue('description');
    final author = record.getStringValue('author');
    final url = Uri.tryParse(record.getStringValue('url'));
    return HymnLink(
      hymnId: hymnId,
      name: name,
      description: description,
      url: url,
      author: author,
    );
  }
}
