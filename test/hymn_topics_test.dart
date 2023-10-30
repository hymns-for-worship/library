import 'package:flutter_test/flutter_test.dart';
import 'package:sqlite3/sqlite3.dart';

import 'package:hfw_library/hfw_library.dart';

void main() {
  Database db = sqlite3.openInMemory();
  HymnTopicsRepository repository = HymnTopicsRepository(db);

  group('hymn topic repository test', () {
    setUp(() {
      db = sqlite3.openInMemory();
      repository = HymnTopicsRepository(db);
    });

    tearDown(() {
      db.dispose();
    });

    test('check all', () {
      final hymnTopics = repository.getAll();

      expect(hymnTopics.length, 0);
    });

    test('add hymn topic', () {
      final hymnTopicId = repository.add((1, 1));
      final hymnTopics = repository.getAll();

      expect(hymnTopicId, 1);
      expect(hymnTopics.length, 1);
      expect(hymnTopics.first.id, 1);
    });

    test('add same hymn topic twice', () {
      final hymnTopicId1 = repository.add((1, 1));
      final hymnTopicId2 = repository.add((1, 1));
      final hymnTopics = repository.getAll();

      expect(hymnTopicId1, 1);
      expect(hymnTopicId2, 1);
      expect(hymnTopics.length, 1);
      expect(hymnTopics.first.id, 1);
    });

    test('add different hymn topics', () {
      final hymnTopicId1 = repository.add((1, 1));
      final hymnTopicId2 = repository.add((2, 2));
      final hymnTopics = repository.getAll();

      expect(hymnTopicId1, 1);
      expect(hymnTopicId2, 2);
      expect(hymnTopics.length, 2);
      expect(hymnTopics.first.id, 1);
      expect(hymnTopics.last.id, 2);
    });
  });
}
