import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:hfw_library/hfw_library.dart';

void main() {
  Database db = sqlite3.openInMemory();
  HymnScripturesRepository repository = HymnScripturesRepository(db);

  group('hymn scripture repository test', () {
    setUp(() {
      db = sqlite3.openInMemory();
      repository = HymnScripturesRepository(db);
    });

    tearDown(() {
      db.dispose();
    });

    test('check all', () {
      final hymnScriptures = repository.getAll();

      expect(hymnScriptures.length, 0);
    });

    test('add hymn scripture', () {
      final hymnScriptureId = repository.add((1, 1));
      final hymnScriptures = repository.getAll();

      expect(hymnScriptureId, 1);
      expect(hymnScriptures.length, 1);
      expect(hymnScriptures.first.id, 1);
    });

    test('add same hymn scripture twice', () {
      final hymnScriptureId1 = repository.add((1, 1));
      final hymnScriptureId2 = repository.add((1, 1));
      final hymnScriptures = repository.getAll();

      expect(hymnScriptureId1, 1);
      expect(hymnScriptureId2, 1);
      expect(hymnScriptures.length, 1);
      expect(hymnScriptures.first.id, 1);
    });

    test('add different hymn scriptures', () {
      final hymnScriptureId1 = repository.add((1, 1));
      final hymnScriptureId2 = repository.add((2, 2));
      final hymnScriptures = repository.getAll();

      expect(hymnScriptureId1, 1);
      expect(hymnScriptureId2, 2);
      expect(hymnScriptures.length, 2);
      expect(hymnScriptures.first.id, 1);
      expect(hymnScriptures.last.id, 2);
    });
  });
}
