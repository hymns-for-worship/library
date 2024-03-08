import 'dart:convert';
import 'dart:isolate';

import 'package:drift/isolate.dart';
import 'package:flutter/foundation.dart';
import 'package:hfw_core/src/domain/model/playlist.dart';

import '../../data/source/database/database.dart';
import '../../data/source/pocketbase/admin.dart';
import '../../data/source/pocketbase/get_records.dart';

class SyncBackgroundService {
  final HfwDatabase db;

  SyncBackgroundService(this.db);

  bool get active => _database != null;
  static HfwDatabase? _database;

  Future<HfwDatabase> open() async {
    if (_database != null) return _database!;
    final connection = await db.serializableConnection();
    _database = HfwDatabase(await connection.connect());
    return _database!;
  }

  Future<void> close() async {
    await _database?.close();
    _database = null;
  }

  Future<void> call(String userId) => Isolate.run(
        // TODO: Migrate old data on server
        () async {
          final db = await open();
          final pb = await adminClient();
          final staleDate = DateTime.now().subtract(const Duration(days: 30));
          await db.deleteOldRecords(staleDate);
          bool subscribed = false;
          final collections = <GetRecords>[
            for (final collection in [
              'playlists',
              'playlist_items',
              'user_library',
              'user_purchases',
              'analytics',
            ]) ...[
              GetRecords(
                db: db,
                client: pb,
                collectionName: collection,
                itemFromRecord: (e) => jsonDecode(e.data),
                itemFromRecordModel: (e) => e.toJson(),
                getRecords: (_) => db.getRecordsWithFilter(collection, {
                  'user': userId,
                }),
              ),
            ],
          ];
          while (active) {
            // Sync local with remote
            if (!subscribed) {
              try {
                for (final collection in collections) {
                  await collection.subscribe();
                  await collection.checkForUpdate(null).last;
                }
                subscribed = true;
              } catch (e, t) {
                debugPrint('error subscribe to collections: $e $t');
                subscribed = false;
              }
            }
            final playlists = await db.getPlaylists(userId).get();
            for (final item in playlists.where((e) => e.synced == false)) {
              if (item.user != userId) continue;
              try {
                if (item.fresh == true) {
                  await pb.collection('playlists').create(body: {
                    ...item.toData(),
                    'id': item.id,
                  });
                  await db.setSyncStatusRecordModel(
                    true,
                    item.id,
                    'playlists',
                  );
                  await db.setFreshStatusRecordModel(
                    false,
                    item.id,
                    'playlists',
                  );
                } else {
                  await pb.collection('playlists').update(item.id, body: {
                    ...item.toData(),
                    'id': item.id,
                  });
                  await db.setSyncStatusRecordModel(
                    true,
                    item.id,
                    'playlists',
                  );
                }
              } catch (e, t) {
                debugPrint('error sync playlist ${item.id}: $e $t');
              }
            }
            final playlistItems = await db.getPlaylistItems().get();
            for (final item in playlistItems.where((e) => e.synced == false)) {
              if (item.user != userId) continue;
              try {
                if (item.fresh == true) {
                  await pb.collection('playlist_items').create(body: {
                    ...item.toData(),
                    'id': item.id,
                  });
                  await db.setSyncStatusRecordModel(
                    true,
                    item.id,
                    'playlist_items',
                  );
                  await db.setFreshStatusRecordModel(
                    false,
                    item.id,
                    'playlist_items',
                  );
                } else {
                  await pb.collection('playlist_items').update(item.id, body: {
                    ...item.toData(),
                    'id': item.id,
                  });
                  await db.setSyncStatusRecordModel(
                    true,
                    item.id,
                    'playlist_items',
                  );
                }
              } catch (e, t) {
                debugPrint('error sync playlist item ${item.id}: $e $t');
              }
            }
            final userLibrary = await db.getUserLibrary(userId).get();
            for (final item in userLibrary.where((e) => e.synced == false)) {
              if (item.user != userId) continue;
              try {
                if (item.fresh == true) {
                  await pb.collection('user_library').create(body: {
                    ...item.toData(),
                    'id': item.id,
                  });
                  await db.setSyncStatusRecordModel(
                    true,
                    item.id,
                    'user_library',
                  );
                  await db.setFreshStatusRecordModel(
                    false,
                    item.id,
                    'user_library',
                  );
                } else {
                  await pb.collection('user_library').update(item.id, body: {
                    ...item.toData(),
                    'id': item.id,
                  });
                  await db.setSyncStatusRecordModel(
                    true,
                    item.id,
                    'user_library',
                  );
                }
              } catch (e, t) {
                debugPrint('error sync playlist ${item.id}: $e $t');
              }
            }
            final userPurchases = await db.getUserPurchases(userId, null).get();
            for (final item in userPurchases.where((e) => e.synced == false)) {
              if (item.user != userId) continue;
              try {
                if (item.fresh == true) {
                  await pb.collection('user_purchases').create(body: {
                    ...item.toData(),
                    'id': item.id,
                  });
                  await db.setSyncStatusRecordModel(
                    true,
                    item.id,
                    'user_purchases',
                  );
                  await db.setFreshStatusRecordModel(
                    false,
                    item.id,
                    'user_purchases',
                  );
                } else {
                  await pb.collection('user_purchases').update(item.id, body: {
                    ...item.toData(),
                    'id': item.id,
                  });
                  await db.setSyncStatusRecordModel(
                    true,
                    item.id,
                    'user_purchases',
                  );
                }
              } catch (e, t) {
                debugPrint('error sync user_purchase ${item.id}: $e $t');
              }
            }
            final analytics = await db.getAnalytics(userId, null).get();
            for (final item in analytics.where((e) => e.synced == false)) {
              if (item.user != userId) continue;
              try {
                if (item.fresh == true) {
                  await pb.collection('analytics').create(body: {
                    ...item.toData(),
                    'id': item.id,
                  });
                  await db.setSyncStatusRecordModel(
                    true,
                    item.id,
                    'analytics',
                  );
                  await db.setFreshStatusRecordModel(
                    false,
                    item.id,
                    'analytics',
                  );
                } else {
                  await pb.collection('analytics').update(item.id, body: {
                    ...item.toData(),
                    'id': item.id,
                  });
                  await db.setSyncStatusRecordModel(
                    true,
                    item.id,
                    'analytics',
                  );
                }
              } catch (e, t) {
                debugPrint('error sync user_purchase ${item.id}: $e $t');
              }
            }
            const delay = Duration(minutes: 1);
            debugPrint('sync completed, will restart in ${delay.inSeconds}s');
            await Future.delayed(delay);
          }
        },
        debugName: 'Background sync service for $userId',
      );
}

extension on UserLibraryData {
  Map<String, Object?> toData() {
    return {
      'user': user,
      'uid': uid,
      'hymn_id': hymnId,
      'playlist_id': playlistId,
      'topic_id': topicId,
      'stakeholder_id': stakeholderId,
    };
  }
}

extension on UserPurchase {
  Map<String, Object?> toData() {
    return {
      'user': user,
      'uid': uid,
      'product_id': productId,
      'platform': platform,
      'amount': amount,
      'purchase_id': purchaseId,
    };
  }
}

extension on Analytic {
  Map<String, Object?> toData() {
    return {
      'user': user,
      'uid': uid,
      'type': type,
      'metadata': jsonDecode(metadata ?? '{}'),
      'platform': jsonDecode(platform ?? '{}'),
      'version': version,
    };
  }
}
