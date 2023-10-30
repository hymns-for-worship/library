import 'package:sqlite3/sqlite3.dart';

class Stakeholder {
  final int id;
  final String name;

  const Stakeholder({
    required this.id,
    required this.name,
  });

  factory Stakeholder.fromRow(Row row) {
    return Stakeholder(
      id: row['id'] as int,
      name: row['name'] as String,
    );
  }
}

class HymnStakeholder {
  final int id;
  final int hymnId;
  final int stakeholderId;
  final String relationship;

  const HymnStakeholder({
    required this.id,
    required this.hymnId,
    required this.stakeholderId,
    required this.relationship,
  });

  factory HymnStakeholder.fromRow(Row row) {
    return HymnStakeholder(
      id: row['id'] as int,
      hymnId: row['hymnId'] as int,
      stakeholderId: row['stakeholderId'] as int,
      relationship: row['relationship'] as String,
    );
  }
}
