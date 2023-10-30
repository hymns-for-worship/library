import 'package:sqlite3/sqlite3.dart';

class Asset {
  final int id;
  final String path;
  final DateTime lastModified;

  const Asset({
    required this.id,
    required this.path,
    required this.lastModified,
  });

  factory Asset.fromRow(Row row) {
    return Asset(
      id: row['id'] as int,
      path: row['path'] as String,
      lastModified: DateTime.parse(row['lastModified'] as String),
    );
  }

  String get filename {
    return path.split('/').last;
  }

  String get ext {
    return filename.split('.').last;
  }

  String get name {
    return filename.split('.').first;
  }
}
