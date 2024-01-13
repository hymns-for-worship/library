import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../data/source/pocketbase/client.dart';
import '../../../data/source/pocketbase/get_records.dart';
import '../../model/hymn_download.dart';

class GetDownloads extends GetRecords<HymnDownload, void> {
  GetDownloads({required super.db, required super.client})
      : super(
          collectionName: 'bundles',
          itemFromRecordModel: (record) => record.toHymnDownload(client),
          itemFromRecord: (record) =>
              RecordModel.fromJson(jsonDecode(record.data))
                  .toHymnDownload(client),
          getRecords: (user) => db.getRecordModelsByCollection('bundles'),
          // fields: 'id,created,updated,hash,file,hymn_id,expand.hymn_id.title,expand.hymn_id.number',
          expand: 'hymn_id',
        );
}

extension HymnDownloadRecordModel on RecordModel {
  HymnDownload toHymnDownload(HfwStudio client) {
    final hymnId = getStringValue('hymn_id');
    final file = getStringValue('file');
    final hash = getStringValue('hash');
    final url = client.getFileUrl(this, file);
    final hymnRecord = expand['hymn_id']!.first;
    final hymnTitle = hymnRecord.getStringValue('title');
    final hymnNumber = hymnRecord.getStringValue('number');
    return HymnDownload(
      hymnId: hymnId,
      hymnTitle: hymnTitle,
      hymnNumber: hymnNumber,
      hymnalName: '',
      created: DateTime.parse(created),
      updated: DateTime.parse(updated),
      url: url,
      hash: hash,
      file: file,
    );
  }
}
