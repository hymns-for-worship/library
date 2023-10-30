import 'package:sqlite3/sqlite3.dart';

class SheetMusic {
  final int id;
  final String path;
  final String size;

  const SheetMusic({
    required this.id,
    required this.path,
    required this.size,
  });

  factory SheetMusic.fromRow(Row row) {
    return SheetMusic(
      id: row['id'] as int,
      path: row['path'] as String,
      size: row['size'] as String,
    );
  }
}

class HymnSheetMusic {
  final int id;
  final int hymnId;
  final int sheetMusicId;

  const HymnSheetMusic({
    required this.id,
    required this.hymnId,
    required this.sheetMusicId,
  });

  factory HymnSheetMusic.fromRow(Row row) {
    return HymnSheetMusic(
      id: row['id'] as int,
      hymnId: row['hymnId'] as int,
      sheetMusicId: row['sheetMusicId'] as int,
    );
  }
}
