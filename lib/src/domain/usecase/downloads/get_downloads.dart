import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../data/source/pocketbase/client.dart';
import '../../../data/source/pocketbase/get_records.dart';
import '../../model/hymn_download.dart';

class GetDownloads extends GetRecords<HymnDownload, void> {
  GetDownloads({required super.db, required super.client})
      : super(
          collectionName: 'bundles',
          itemFromRecordModel: (record) => _map(client, record),
          itemFromRecord: (record) =>
              _map(client, RecordModel.fromJson(jsonDecode(record.data))),
          getRecords: (args) => db.getRecordModelByCollectionName('bundles'),
          fields:
              'id,created,updated,hash,file,hymn_id,expand.hymn_id.title,expand.hymn_id.number',
        );

  static HymnDownload _map(HfwStudio client, RecordModel record) {
    final hymnId = record.getStringValue('hymn_id');
    final file = record.getStringValue('file');
    final hash = record.getStringValue('hash');
    final url = client.getFileUrl(record, file);
    final hymnRecord = record.expand['hymn_id']!.first;
    final hymnTitle = hymnRecord.getStringValue('title');
    final hymnNumber = hymnRecord.getStringValue('number');
    final created = DateTime.parse(record.created);
    final updated = DateTime.parse(record.updated);
    return HymnDownload(
      hymnId: hymnId,
      hymnTitle: hymnTitle,
      hymnNumber: hymnNumber,
      created: created,
      updated: updated,
      url: url,
      hash: hash,
      file: file,
    );
  }
}
