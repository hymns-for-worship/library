import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:hfw_library/hfw_library.dart';

void main() {
  Database db = sqlite3.openInMemory();
  HymnHymnalsRepository repository = HymnHymnalsRepository(db);

  group('hymn hymnal repository test', () {
    setUp(() {
      db = sqlite3.openInMemory();
      repository = HymnHymnalsRepository(db);
    });

    tearDown(() {
      db.dispose();
    });

    test('check all', () {
      final hymnHymnals = repository.getAll();

      expect(hymnHymnals.length, 0);
    });

    test('add hymn hymnal', () {
      final hymnHymnalId = repository.add((1, 1));
      final hymnHymnals = repository.getAll();

      expect(hymnHymnalId, 1);
      expect(hymnHymnals.length, 1);
      expect(hymnHymnals.first.id, 1);
    });

    test('add same hymn hymnal twice', () {
      final hymnHymnalId1 = repository.add((1, 1));
      final hymnHymnalId2 = repository.add((1, 1));
      final hymnHymnals = repository.getAll();

      expect(hymnHymnalId1, 1);
      expect(hymnHymnalId2, 1);
      expect(hymnHymnals.length, 1);
      expect(hymnHymnals.first.id, 1);
    });

    test('add different hymn hymnals', () {
      final hymnHymnalId1 = repository.add((1, 1));
      final hymnHymnalId2 = repository.add((2, 2));
      final hymnHymnals = repository.getAll();

      expect(hymnHymnalId1, 1);
      expect(hymnHymnalId2, 2);
      expect(hymnHymnals.length, 2);
      expect(hymnHymnals.first.id, 1);
      expect(hymnHymnals.last.id, 2);
    });
  });
}
