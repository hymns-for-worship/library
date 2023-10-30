import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:hfw_library/hfw_library.dart';

void main() {
  Database db = sqlite3.openInMemory();
  HymnPortionsRepository repository = HymnPortionsRepository(db);

  group('hymn portion repository test', () {
    setUp(() {
      db = sqlite3.openInMemory();
      repository = HymnPortionsRepository(db);
    });

    tearDown(() {
      db.dispose();
    });

    test('check all', () {
      final hymnPortions = repository.getAll();

      expect(hymnPortions.length, 0);
    });

    test('add hymn portion', () {
      final hymnPortionId = repository.add((1, 1));
      final hymnPortions = repository.getAll();

      expect(hymnPortionId, 1);
      expect(hymnPortions.length, 1);
      expect(hymnPortions.first.id, 1);
    });

    test('add same hymn portion twice', () {
      final hymnPortionId1 = repository.add((1, 1));
      final hymnPortionId2 = repository.add((1, 1));
      final hymnPortions = repository.getAll();

      expect(hymnPortionId1, 1);
      expect(hymnPortionId2, 1);
      expect(hymnPortions.length, 1);
      expect(hymnPortions.first.id, 1);
    });

    test('add different hymn portions', () {
      final hymnPortionId1 = repository.add((1, 1));
      final hymnPortionId2 = repository.add((2, 2));
      final hymnPortions = repository.getAll();

      expect(hymnPortionId1, 1);
      expect(hymnPortionId2, 2);
      expect(hymnPortions.length, 2);
      expect(hymnPortions.first.id, 1);
      expect(hymnPortions.last.id, 2);
    });
  });
}
