import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:drift/drift.dart';
import 'package:drift/extensions/json1.dart';

import '../../../domain/model/playlist_item.dart';
import 'schema_versions.dart';
export 'extension.dart';
export 'sql/converters.dart';

part 'database.g.dart';

typedef ParseRecord<T> = T Function(Record, Map<String, dynamic>);

@DriftDatabase(include: {
  'sql/records.drift',
  // 'sql/bundles.drift',
  'sql/hymns.drift',
  'sql/topics.drift',
  'sql/hymn_topics.drift',
  'sql/stakeholders.drift',
  'sql/hymn_stakeholders.drift',
  'sql/scriptures.drift',
  'sql/hymn_scriptures.drift',
  'sql/categories.drift',
  'sql/hymn_categories.drift',
  'sql/hymnals.drift',
  'sql/hymn_hymnals.drift',
  'sql/portions.drift',
  'sql/hymn_portions.drift',
  'sql/playlists.drift',
  // 'sql/playlist_items.drift',
  'sql/hymn_links.drift',
  'sql/user_library.drift',
  'sql/user_purchases.drift',
  'sql/analytics.drift',
  'sql/offline_queue.drift',
  'sql/request_cache.drift',
  'sql/users.drift',
})
class HfwDatabase extends _$HfwDatabase {
  HfwDatabase(super.connection);

  @override
  int get schemaVersion => 2;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: stepByStep(
        from1To2: (m, schema) async {
          await m.recreateAllViews();
        },
      ),
    );
  }

  Selectable<Record> getRecordsWithFilter(
    String collectionName,
    Map<String, String> filters,
  ) {
    final query = records.select();
    query.where((tbl) => tbl.collectionName.equals(collectionName));
    for (final filter in filters.entries) {
      query.where(
        (tbl) => tbl.data.jsonExtract('\$.${filter.key}').equals(filter.value),
      );
    }
    return query;
  }

  Future<String> insertOrUpdateHymn(HymnsCompanion companion) async {
    final current = await getHymn(companion.id.value).getSingleOrNull();
    if (current == null) {
      await into(hymns).insert(companion);
    } else {
      await update(hymns).replace(companion);
    }
    return companion.id.value;
  }

  Selectable<T> _get<T>(String collection, ParseRecord<T> parse) {
    final records = getRecordModelsByCollection(collection);
    return records.map((e) {
      final map = jsonDecode(e.data) as Map<String, dynamic>;
      return parse(e, map);
    });
  }

  Future<List<T>> get<T>(String collection, ParseRecord<T> parse) {
    return _get(collection, parse).get();
  }

  Future<T> getSingle<T>(String collection, ParseRecord<T> parse) {
    return _get(collection, parse).getSingle();
  }

  Future<T?> getSingleOrNull<T>(String collection, ParseRecord<T> parse) {
    return _get(collection, parse).getSingleOrNull();
  }

  Stream<List<T>> watch<T>(String collection, ParseRecord<T> parse) {
    return _get(collection, parse).watch();
  }

  Stream<T> watchSingle<T>(String collection, ParseRecord<T> parse) {
    return _get(collection, parse).watchSingle();
  }

  Stream<T?> watchSingleOrNull<T>(String collection, ParseRecord<T> parse) {
    return _get(collection, parse).watchSingleOrNull();
  }

  Selectable<PlaylistItem> getPlaylistItems() {
    return _get(
      'playlist_items',
      (e, map) => PlaylistItem(
        id: e.id,
        created: e.created,
        updated: e.updated,
        deleted: e.deleted,
        collectionId: e.collectionId,
        collectionName: e.collectionName,
        synced: e.synced,
        user: map['user'],
        uid: map['uid'],
        playlistId: map['playlist_id'],
        hymnId: map['hymn_id'],
        parts: ((map['parts'] ?? []) as List).cast<String>(),
        text: map['text'],
        color: map['color'],
        image: map['image'],
        notes: map['notes'],
        order: map['order'],
      ),
    );
  }

  Stream<List<PlaylistItem>> getPlaylistItemsForUser(String userId) {
    final items = getPlaylistItems().watch();
    return items.map((e) => e
        .where((e) => e.deleted != true)
        .where((e) => e.user == userId)
        .toList());
  }

  Stream<List<PlaylistItem>> getPlaylistItemsForPlaylist(String playlistId) {
    final items = getPlaylistItems().watch();
    return items.map((e) => e
        .where((e) => e.deleted != true)
        .where((e) => e.playlistId == playlistId)
        .toList());
  }

  Stream<PlaylistItem?> getPlaylistItem(String playlistId, String id) {
    final items = getPlaylistItemsForPlaylist(playlistId);
    return items.map((e) => e.firstWhereOrNull((e) => e.id == id));
  }
}
