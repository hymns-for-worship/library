import 'package:sqlite3/common.dart';

class Hymnal {
  final int id;
  final String name;
  final String alias;

  const Hymnal({
    required this.id,
    required this.name,
    required this.alias,
  });

  factory Hymnal.fromRow(Row row) {
    return Hymnal(
      id: row['id'] as int,
      name: row['name'] as String,
      alias: row['alias'] as String,
    );
  }
}

class HymnHymnal {
  final int id;
  final int hymnId;
  final int hymnalId;

  const HymnHymnal({
    required this.id,
    required this.hymnId,
    required this.hymnalId,
  });

  factory HymnHymnal.fromRow(Row row) {
    return HymnHymnal(
      id: row['id'] as int,
      hymnId: row['hymnId'] as int,
      hymnalId: row['hymnalId'] as int,
    );
  }
}
