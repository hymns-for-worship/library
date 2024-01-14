//  CASE WHEN json_extract(data, '$.playlist_id') IS NOT NULL THEN CAST(json_extract(data, '$.playlist_id') AS TEXT) ELSE NULL END AS playlist_id,
//     CASE WHEN json_extract(data, '$.hymn_id') IS NOT NULL THEN CAST(json_extract(data, '$.hymn_id') AS TEXT) ELSE NULL END AS hymn_id,
//     CASE WHEN json_extract(data, '$.image') IS NOT NULL THEN CAST(json_extract(data, '$.image') AS TEXT) ELSE NULL END AS image,
//     CASE WHEN json_extract(data, '$.color') IS NOT NULL THEN CAST(json_extract(data, '$.color') AS TEXT) ELSE NULL END AS color,
//     CASE WHEN json_extract(data, '$.notes') IS NOT NULL THEN CAST(json_extract(data, '$.notes') AS TEXT) ELSE NULL END AS notes,
//     CASE WHEN json_extract(data, '$.text') IS NOT NULL THEN CAST(json_extract(data, '$.text') AS TEXT) ELSE NULL END AS [text],
//     CASE WHEN json_extract(data, '$.order') IS NOT NULL THEN CAST(json_extract(data, '$.order') AS REAL) ELSE NULL END AS [order],
//     CASE WHEN json_extract(data, '$.parts') IS NOT NULL THEN CAST(group_concat(json_extract(data, '$.parts')) AS TEXT) ELSE '[]' END MAPPED BY `const JsonStringListConverter()` AS parts

import 'dart:convert';

import 'package:pocketbase/pocketbase.dart';

import '../../data/source/database/database.dart';

class PlaylistItem extends UserRecord {
  String playlistId;
  String? hymnId;
  String? image;
  String? color;
  String? notes;
  String? text;
  num? order;
  List<String> parts;

  PlaylistItem({
    required super.id,
    required this.playlistId,
    required this.hymnId,
    required this.image,
    required this.color,
    required this.notes,
    required this.text,
    required this.order,
    required this.parts,
    super.collectionId = 'playlist_items',
    super.collectionName = 'playlist_items',
    required super.created,
    required super.updated,
    required super.deleted,
    required super.user,
    required super.uid,
    super.synced = true,
  }) : super(
          data: jsonEncode({
            'id': id,
            'playlist_id': playlistId,
            'hymn_id': hymnId,
            'image': image,
            'color': color,
            'notes': notes,
            'text': text,
            'order': order,
            'parts': parts,
            'collectionName': collectionName,
            'collectionId': collectionId,
            'created': created.toIso8601String(),
            'updated': updated.toIso8601String(),
          }),
        );

  factory PlaylistItem.fromRecordModel(
    RecordModel model, {
    bool synced = true,
  }) {
    return PlaylistItem(
      id: model.id,
      playlistId: model.getStringValue('playlist_id'),
      hymnId: model.getStringValue('hymn_id'),
      image: model.getStringValue('image'),
      color: model.getStringValue('color'),
      notes: model.getStringValue('notes'),
      text: model.getStringValue('text'),
      user: model.getStringValue('user'),
      uid: model.getStringValue('uid'),
      order: model.getDoubleValue('order'),
      deleted: model.getBoolValue('deleted'),
      parts: (jsonDecode(model.data['parts'] ?? '[]') as List).cast<String>(),
      collectionId: model.collectionId,
      collectionName: model.collectionName,
      created: DateTime.parse(model.created),
      updated: DateTime.parse(model.updated),
      synced: synced,
    );
  }

  Map<String, dynamic> toData() {
    final data = jsonDecode(this.data) as Map<String, dynamic>;
    return data;
  }
}
