import 'package:sqlite3/common.dart';

class Scripture {
  final int id;
  final String name;

  const Scripture({
    required this.id,
    required this.name,
  });

  factory Scripture.fromRow(Row row) {
    return Scripture(
      id: row['id'] as int,
      name: row['name'] as String,
    );
  }
}

class HymnScripture {
  final int id;
  final int hymnId;
  final int scriptureId;

  const HymnScripture({
    required this.id,
    required this.hymnId,
    required this.scriptureId,
  });

  factory HymnScripture.fromRow(Row row) {
    return HymnScripture(
      id: row['id'] as int,
      hymnId: row['hymnId'] as int,
      scriptureId: row['scriptureId'] as int,
    );
  }
}
