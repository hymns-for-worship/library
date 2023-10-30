import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:hfw_library/hfw_library.dart';

void main() {
  Database db = sqlite3.openInMemory();
  HymnalsRepository repository = HymnalsRepository(db);

  group('hymnal repository test', () {
    setUp(() {
      db = sqlite3.openInMemory();
      repository = HymnalsRepository(db);
    });

    tearDown(() {
      db.dispose();
    });

    group('hymnals', () {
      test('check all', () {
        final hymnals = repository.getAll();

        expect(hymnals.length, 0);
      });

      test('add hymnal', () {
        final hymnalId = repository.add(('Hymnal 1', 'H'));
        final hymnals = repository.getAll();

        expect(hymnalId, 1);
        expect(hymnals.length, 1);
        expect(hymnals.first.id, 1);
      });

      test('add same hymnal twice', () {
        final hymnalId1 = repository.add(('Hymnal 1', 'H'));
        final hymnalId2 = repository.add(('Hymnal 1', 'H'));
        final hymnals = repository.getAll();

        expect(hymnalId1, 1);
        expect(hymnalId2, 1);
        expect(hymnals.length, 1);
        expect(hymnals.first.id, 1);
      });

      test('add different hymnals', () {
        final hymnalId1 = repository.add(('Hymnal 1', 'H1'));
        final hymnalId2 = repository.add(('Hymnal 2', 'H2'));
        final hymnals = repository.getAll();

        expect(hymnalId1, 1);
        expect(hymnalId2, 2);
        expect(hymnals.length, 2);
        expect(hymnals.first.id, 1);
        expect(hymnals.last.id, 2);
      });

      test('remove hymnal', () {
        final hymnalId1 = repository.add(('Hymnal 1', 'H1'));
        final hymnalId2 = repository.add(('Hymnal 2', 'H2'));
        final hymnals1 = repository.getAll();

        expect(hymnalId1, 1);
        expect(hymnalId2, 2);
        expect(hymnals1.length, 2);
        expect(hymnals1.first.id, 1);
        expect(hymnals1.last.id, 2);

        repository.deleteById(hymnalId1);
        final hymnals2 = repository.getAll();

        expect(hymnals2.length, 1);
        expect(hymnals2.first.id, 2);
      });
    });
  });
}
