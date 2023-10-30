import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:hfw_library/hfw_library.dart';

void main() {
  Database db = sqlite3.openInMemory();
  StakeholdersRepository repository = StakeholdersRepository(db);

  group('stakeholder repository test', () {
    setUp(() {
      db = sqlite3.openInMemory();
      repository = StakeholdersRepository(db);
    });

    tearDown(() {
      db.dispose();
    });

    group('stakeholders', () {
      test('check all', () {
        final stakeholders = repository.getAll();

        expect(stakeholders.length, 0);
      });

      test('add stakeholder', () {
        final stakeholderId = repository.add(('Stakeholder 1'));
        final stakeholders = repository.getAll();

        expect(stakeholderId, 1);
        expect(stakeholders.length, 1);
        expect(stakeholders.first.id, 1);
      });

      test('add same stakeholder twice', () {
        final stakeholderId1 = repository.add(('Stakeholder 1'));
        final stakeholderId2 = repository.add(('Stakeholder 1'));
        final stakeholders = repository.getAll();

        expect(stakeholderId1, 1);
        expect(stakeholderId2, 1);
        expect(stakeholders.length, 1);
        expect(stakeholders.first.id, 1);
      });

      test('add different stakeholders', () {
        final stakeholderId1 = repository.add(('Stakeholder 1'));
        final stakeholderId2 = repository.add(('Stakeholder 2'));
        final stakeholders = repository.getAll();

        expect(stakeholderId1, 1);
        expect(stakeholderId2, 2);
        expect(stakeholders.length, 2);
        expect(stakeholders.first.id, 1);
        expect(stakeholders.last.id, 2);
      });

      test('remove stakeholder', () {
        final stakeholderId1 = repository.add(('Stakeholder 1'));
        final stakeholderId2 = repository.add(('Stakeholder 2'));
        final stakeholders1 = repository.getAll();

        expect(stakeholderId1, 1);
        expect(stakeholderId2, 2);
        expect(stakeholders1.length, 2);
        expect(stakeholders1.first.id, 1);
        expect(stakeholders1.last.id, 2);

        repository.deleteById(stakeholderId1);
        final stakeholders2 = repository.getAll();

        expect(stakeholders2.length, 1);
        expect(stakeholders2.first.id, 2);
      });
    });
  });
}
