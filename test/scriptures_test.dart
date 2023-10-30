import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:hfw_library/hfw_library.dart';

void main() {
  Database db = sqlite3.openInMemory();
  ScripturesRepository repository = ScripturesRepository(db);

  group('scripture repository test', () {
    setUp(() {
      db = sqlite3.openInMemory();
      repository = ScripturesRepository(db);
    });

    tearDown(() {
      db.dispose();
    });

    group('scriptures', () {
      test('check all', () {
        final scriptures = repository.getAll();

        expect(scriptures.length, 0);
      });

      test('add scripture', () {
        final scriptureId = repository.add('Scripture 1');
        final scriptures = repository.getAll();

        expect(scriptureId, 1);
        expect(scriptures.length, 1);
        expect(scriptures.first.id, 1);
      });

      test('add same scripture twice', () {
        final scriptureId1 = repository.add('Scripture 1');
        final scriptureId2 = repository.add('Scripture 1');
        final scriptures = repository.getAll();

        expect(scriptureId1, 1);
        expect(scriptureId2, 1);
        expect(scriptures.length, 1);
        expect(scriptures.first.id, 1);
      });

      test('add different scriptures', () {
        final scriptureId1 = repository.add('Scripture 1');
        final scriptureId2 = repository.add('Scripture 2');
        final scriptures = repository.getAll();

        expect(scriptureId1, 1);
        expect(scriptureId2, 2);
        expect(scriptures.length, 2);
        expect(scriptures.first.id, 1);
        expect(scriptures.last.id, 2);
      });

      test('remove scripture', () {
        final scriptureId1 = repository.add('Scripture 1');
        final scriptureId2 = repository.add('Scripture 2');
        final scriptures1 = repository.getAll();

        expect(scriptureId1, 1);
        expect(scriptureId2, 2);
        expect(scriptures1.length, 2);
        expect(scriptures1.first.id, 1);
        expect(scriptures1.last.id, 2);

        repository.deleteById(scriptureId1);
        final scriptures2 = repository.getAll();

        expect(scriptures2.length, 1);
        expect(scriptures2.first.id, 2);
      });
    });
  });
}
