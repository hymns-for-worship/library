import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:hfw_library/hfw_library.dart';

void main() {
  Database db = sqlite3.openInMemory();
  HymnStakeholdersRepository repository = HymnStakeholdersRepository(db);

  group('hymn stakeholder repository test', () {
    setUp(() {
      db = sqlite3.openInMemory();
      repository = HymnStakeholdersRepository(db);
    });

    tearDown(() {
      db.dispose();
    });

    test('check all', () {
      final hymnStakeholders = repository.getAll();

      expect(hymnStakeholders.length, 0);
    });

    test('add hymn stakeholder', () {
      final hymnStakeholderId = repository.add((1, 1, 'lyrics'));
      final hymnStakeholders = repository.getAll();

      expect(hymnStakeholderId, 1);
      expect(hymnStakeholders.length, 1);
      expect(hymnStakeholders.first.id, 1);
    });

    test('add same hymn stakeholder twice', () {
      final hymnStakeholderId1 = repository.add((1, 1, 'lyrics'));
      final hymnStakeholderId2 = repository.add((1, 1, 'lyrics'));
      final hymnStakeholders = repository.getAll();

      expect(hymnStakeholderId1, 1);
      expect(hymnStakeholderId2, 1);
      expect(hymnStakeholders.length, 1);
      expect(hymnStakeholders.first.id, 1);
    });

    test('add different hymn stakeholders', () {
      final hymnStakeholderId1 = repository.add((1, 1, 'lyrics'));
      final hymnStakeholderId2 = repository.add((2, 2, 'lyrics'));
      final hymnStakeholders = repository.getAll();

      expect(hymnStakeholderId1, 1);
      expect(hymnStakeholderId2, 2);
      expect(hymnStakeholders.length, 2);
      expect(hymnStakeholders.first.id, 1);
      expect(hymnStakeholders.last.id, 2);
    });
  });
}
