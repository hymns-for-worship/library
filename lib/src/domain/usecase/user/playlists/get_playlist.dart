// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:convert';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/pocketbase/client.dart';
import 'package:stream_transform/stream_transform.dart';

typedef PlaylistResult = (Playlist?, List<PlaylistItem>);

class GetPlaylist {
  final HfwStudio client;
  final HfwDatabase db;
  final _dispose = <void Function()>[];
  bool _subscribed = false;
  final String collectionName = 'playlists';
  final String id;

  GetPlaylist({
    required this.client,
    required this.db,
    required this.id,
  });

  Stream<PlaylistResult> call(String userId) async* {
    final now = DateTime.now();
    try {
      final current = await client.collection(collectionName).getOne(id);
      final existing = await db.getRecordsWithFilter(collectionName, {
        'user': userId,
        'id': id,
      }).getSingleOrNull();
      if (existing == null) {
        await db.createRecordModel(
          current.id,
          current.collectionId,
          current.collectionName,
          jsonEncode(current.toJson()),
          false,
          true,
          now,
          now,
        );
      } else {
        await db.updateRecordModel(
          jsonEncode(current.toJson()),
          false,
          true,
          now,
          current.id,
        );
      }
    } catch (e) {
      // ignore: avoid_print
      print('error getting $collectionName record by $id');
    }
    try {
      final current = await client.collection('playlist_items').getFullList();
      final existing = await db.getRecordsWithFilter('playlist_items', {
        'user': userId,
        'playlist_id': id,
      }).get();
      for (final item in current) {
        final exists = existing.any((e) => e.id == item.id);
        if (exists) {
          await db.updateRecordModel(
            jsonEncode(item.toJson()),
            false,
            true,
            now,
            item.id,
          );
        } else {
          await db.createRecordModel(
            item.id,
            item.collectionId,
            item.collectionName,
            jsonEncode(item.toJson()),
            false,
            true,
            now,
            now,
          );
        }
      }
      // TODO: CRDT
      // TODO: Delete current
    } catch (e) {}
    final playlist = db.getRecordsWithFilter(collectionName, {
      'user': userId,
      'id': id,
    });
    final items = db.getRecordsWithFilter('playlist_items', {
      'user': userId,
      'playlist_id': id,
    });
    yield* playlist.watchSingleOrNull().combineLatest(
      items.watch(),
      (playlist, items) {
        Playlist? _playlist;
        if (playlist != null) {
          _playlist = Playlist.fromJson(jsonDecode(playlist.data));
        }
        final _items = items //
            .map((item) => PlaylistItem.fromJson(jsonDecode(item.data)))
            .toList();
        return (_playlist, _items);
      },
    );
  }

  Future<void> subscribe() async {
    if (_subscribed) return;
    try {
      final playlistDispose =
          await client.collection(collectionName).subscribe(id, (e) async {
        final item = e.record;
        switch (e.action) {
          case 'create':
            if (item != null) {
              await db.createRecordModel(
                item.id,
                item.collectionId,
                item.collectionName,
                jsonEncode(item.toJson()),
                false,
                true,
                DateTime.now(),
                DateTime.now(),
              );
            }
            break;
          case 'update':
            if (item != null) {
              await db.updateRecordModel(
                jsonEncode(item.toJson()),
                false,
                true,
                DateTime.now(),
                item.id,
              );
            }
            break;
          case 'delete':
            if (item != null) {
              await db.updateRecordModel(
                jsonEncode(item.toJson()),
                true,
                true,
                DateTime.now(),
                item.id,
              );
            }
            break;
          default:
        }
      });
      _dispose.add(playlistDispose);
      final playlistItemsDispose =
          await client.collection('playlist_items').subscribe('*', (e) async {
        final item = e.record;
        switch (e.action) {
          case 'create':
            if (item != null) {
              await db.createRecordModel(
                item.id,
                item.collectionId,
                item.collectionName,
                jsonEncode(item.toJson()),
                false,
                true,
                DateTime.now(),
                DateTime.now(),
              );
            }
            break;
          case 'update':
            if (item != null) {
              await db.updateRecordModel(
                jsonEncode(item.toJson()),
                false,
                true,
                DateTime.now(),
                item.id,
              );
            }
            break;
          case 'delete':
            if (item != null) {
              await db.updateRecordModel(
                jsonEncode(item.toJson()),
                true,
                true,
                DateTime.now(),
                item.id,
              );
            }
            break;
          default:
        }
      });
      _dispose.add(playlistItemsDispose);
      _subscribed = true;
    } catch (error, stackTrace) {
      // ignore: avoid_print
      print('error subscribing to $collectionName $error $stackTrace');
      _subscribed = false;
    }
  }

  void dispose() {
    for (final cb in _dispose) {
      cb();
    }
    _dispose.clear();
  }
}
