import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../../data/source/pocketbase/get_records.dart';
import '../../../model/top_hymn.dart';

class GetTopHymns extends GetRecords<TopHymn, void> {
  GetTopHymns({required super.db, required super.client})
      : super(
          collectionName: 'analytics_top_hymns',
          itemFromRecordModel: (record) => record.toTopHymn(),
          itemFromRecord: (record) =>
              RecordModel.fromJson(jsonDecode(record.data)).toTopHymn(),
          getRecords: (user) =>
              db.getRecordModelsByCollection('analytics_top_hymns'),
        );
}

extension TopHymnRecordModelUtils on RecordModel {
  TopHymn toTopHymn() {
    final hymnId = getStringValue('hymn_id');
    final title = getStringValue('title');
    final number = getStringValue('number');
    final viewCount = getIntValue('view_count');
    final viewDate = getStringValue('view_date');
    return TopHymn(
      hymnId: hymnId,
      title: title,
      number: number,
      viewCount: viewCount,
      viewDate: DateTime.tryParse(viewDate) ?? DateTime.now(),
    );
  }
}
