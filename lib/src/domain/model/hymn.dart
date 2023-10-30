// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:sqlite3/sqlite3.dart';

class Hymn {
  final int id;
  final String title;
  final String number;
  final String? tuneName;
  final String? startingKey;
  final String? beatPattern;
  final String? startingPitch;
  final String? startingBeat;
  final String? timeSignature;
  final String? startingPitchDirection;
  final String? complexTimeSignature;
  final bool downloaded;
  final DateTime lastModified;

  const Hymn({
    required this.id,
    required this.title,
    required this.number,
    this.tuneName,
    this.startingKey,
    this.beatPattern,
    this.startingPitch,
    this.startingBeat,
    this.startingPitchDirection,
    this.timeSignature,
    this.complexTimeSignature,
    this.downloaded = false,
    required this.lastModified,
  });

  factory Hymn.fromRow(Row row) {
    return Hymn(
      id: row['id'] as int,
      title: row['title'] as String,
      number: row['number'] as String,
      tuneName: row['tuneName'] as String?,
      startingKey: row['startingKey'] as String?,
      beatPattern: row['beatPattern'] as String?,
      startingPitch: row['startingPitch'] as String?,
      startingBeat: row['startingBeat'] as String?,
      startingPitchDirection: row['startingPitchDirection'] as String?,
      timeSignature: row['timeSignature'] as String?,
      complexTimeSignature: row['complexTimeSignature'] as String?,
      downloaded: row['downloaded'] == 1,
      lastModified: DateTime.parse(row['lastModified'] as String),
    );
  }
}


// Hymn parseFromXml(XmlDocument doc) {
//   String title = '';
//   String number = '';
//   String startingKey = '';
//   String beatPattern = '';
//   String startingPitch = '';
//   String startingBeat = '';
//   String timeSignature = '';
//   String? complexTimeSignature;
//   List<String> parts = [];
//   List<String> topics = [];
// }
