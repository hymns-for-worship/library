import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:hfw_library/hfw_library.dart';

void main() {
  Database db = sqlite3.openInMemory();
  PortionsRepository repository = PortionsRepository(db);

  group('portion repository test', () {
    setUp(() {
      db = sqlite3.openInMemory();
      repository = PortionsRepository(db);
    });

    tearDown(() {
      db.dispose();
    });

    group('portions', () {
      test('check all', () {
        final portions = repository.getAll();

        expect(portions.length, 0);
      });

      test('add portion', () {
        final portionId =
            repository.add(('Portion 1', 'This is the first portion', '1'));
        final portions = repository.getAll();

        expect(portionId, '1');
        expect(portions.length, 1);
        expect(portions.first.id, '1');
      });

      test('add same portion twice', () {
        final portionId1 =
            repository.add(('Portion 1', 'This is the first portion', '1'));
        final portionId2 =
            repository.add(('Portion 1', 'This is the first portion', '1'));
        final portions = repository.getAll();

        expect(portionId1, '1');
        expect(portionId2, '1');
        expect(portions.length, 1);
        expect(portions.first.id, '1');
      });

      test('add different portions', () {
        final portionId1 =
            repository.add(('Portion 1', 'This is the first portion', '1'));
        final portionId2 =
            repository.add(('Portion 2', 'This is the second portion', '2'));
        final portions = repository.getAll();

        expect(portionId1, '1');
        expect(portionId2, '2');
        expect(portions.length, 2);
        expect(portions.first.id, '1');
        expect(portions.last.id, '2');
      });

      test('remove portion', () {
        final portionId1 =
            repository.add(('Portion 1', 'This is the first portion', '1'));
        final portionId2 =
            repository.add(('Portion 2', 'This is the second portion', '2'));
        final portions1 = repository.getAll();

        expect(portionId1, '1');
        expect(portionId2, '2');
        expect(portions1.length, 2);
        expect(portions1.first.id, '1');
        expect(portions1.last.id, '2');

        repository.deleteById(portionId1);
        final portions2 = repository.getAll();

        expect(portions2.length, 1);
        expect(portions2.first.id, '2');
      });
    });
  });
}
