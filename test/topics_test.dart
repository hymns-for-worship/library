import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:hfw_library/hfw_library.dart';

void main() {
  Database db = sqlite3.openInMemory();
  TopicsRepository repository = TopicsRepository(db);

  group('topic repository test', () {
    setUp(() {
      db = sqlite3.openInMemory();
      repository = TopicsRepository(db);
    });

    tearDown(() {
      db.dispose();
    });

    group('topics', () {
      test('check all', () {
        final topics = repository.getAll();

        expect(topics.length, 0);
      });

      test('add topic', () {
        final topicId = repository.add('Topic 1');
        final topics = repository.getAll();

        expect(topicId, 1);
        expect(topics.length, 1);
        expect(topics.first.id, 1);
      });

      test('add same topic twice', () {
        final topicId1 = repository.add('Topic 1');
        final topicId2 = repository.add('Topic 1');
        final topics = repository.getAll();

        expect(topicId1, 1);
        expect(topicId2, 1);
        expect(topics.length, 1);
        expect(topics.first.id, 1);
      });

      test('add different topics', () {
        final topicId1 = repository.add('Topic 1');
        final topicId2 = repository.add('Topic 2');
        final topics = repository.getAll();

        expect(topicId1, 1);
        expect(topicId2, 2);
        expect(topics.length, 2);
        expect(topics.first.id, 1);
        expect(topics.last.id, 2);
      });

      test('remove topic', () {
        final topicId1 = repository.add('Topic 1');
        final topicId2 = repository.add('Topic 2');
        final topics1 = repository.getAll();

        expect(topicId1, 1);
        expect(topicId2, 2);
        expect(topics1.length, 2);
        expect(topics1.first.id, 1);
        expect(topics1.last.id, 2);

        repository.deleteById(topicId1);
        final topics2 = repository.getAll();

        expect(topics2.length, 1);
        expect(topics2.first.id, 2);
      });
    });
  });
}
