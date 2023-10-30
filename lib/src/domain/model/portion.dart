import 'package:sqlite3/sqlite3.dart';

class Portion {
  final int id;
  final String name;
  final String lyrics;
  final String hymnPortionId;

  const Portion({
    required this.id,
    required this.name,
    required this.lyrics,
    required this.hymnPortionId,
  });

  factory Portion.fromRow(Row row) {
    return Portion(
      id: row['id'] as int,
      name: row['name'] as String,
      lyrics: row['lyrics'] as String,
      hymnPortionId: row['hymnPortionId']?.toString() ?? '',
    );
  }

  String get short {
    if (name.startsWith('Verse ')) {
      return name.replaceAll('Verse ', 'v');
    } else {
      return name;
    }
  }
}

class HymnPortion {
  final int id;
  final int hymnId;
  final int portionId;

  const HymnPortion({
    required this.id,
    required this.hymnId,
    required this.portionId,
  });

  factory HymnPortion.fromRow(Row row) {
    return HymnPortion(
      id: row['id'] as int,
      hymnId: row['hymnId'] as int,
      portionId: row['portionId'] as int,
    );
  }
}
