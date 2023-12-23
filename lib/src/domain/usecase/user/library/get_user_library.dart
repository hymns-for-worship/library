// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/pocketbase/get_records.dart';
import '../../../model/user_library.dart';

class GetUserLibrary extends GetRecords<UserLibrary, String> {
  GetUserLibrary({required super.db, required super.client})
      : super(
          collectionName: 'user_library',
          itemFromRecordModel: recordModelToUserLibrary,
          itemFromRecord: (record) => recordModelToUserLibrary(
              RecordModel.fromJson(jsonDecode(record.data))),
          getRecords: (args) =>
              db.getRecordModelByCollectionName('user_library'),
          filter: (args) => "user = '$args'",
          staleDuration: const Duration(minutes: 5),
        );

  static UserLibrary recordModelToUserLibrary(RecordModel record) {
    String? getValue(String key) {
      final str = record.getStringValue(key);
      if (str.trim().isEmpty) return null;
      return str;
    }

    return UserLibrary(
      id: record.id,
      created: DateTime.parse(record.created),
      updated: DateTime.parse(record.updated),
      hymn_id: getValue('hymn_id'),
      topic_id: getValue('topic_id'),
      stakeholder_id: getValue('stakeholder_id'),
      playlist_id: getValue('playlist_id'),
      user: record.getStringValue('user'),
      uid: record.getStringValue('uid'),
    );
  }

  static Future<Record?> find(
    HfwDatabase db,
    String user, {
    String? hymnId,
    String? topicId,
    String? stakeholderId,
    String? playlistId,
  }) async {
    final local = await db //
        .getRecordModelByCollectionName('user_library')
        .get();
    Record? item;
    for (final record in local) {
      final data = GetUserLibrary.recordModelToUserLibrary(
          RecordModel.fromJson(jsonDecode(record.data)));
      if (data.user == user) {
        if (hymnId != null && data.hymn_id == hymnId) {
          item = record;
          break;
        } else if (topicId != null && data.topic_id == topicId) {
          item = record;
          break;
        } else if (stakeholderId != null &&
            data.stakeholder_id == stakeholderId) {
          item = record;
          break;
        } else if (playlistId != null && data.playlist_id == playlistId) {
          item = record;
          break;
        }
      }
    }
    return item;
  }
}
