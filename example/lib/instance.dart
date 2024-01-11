import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:pocketbase_ui/pocketbase_ui.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'router.dart';

final $ = GetIt.instance;

Future<void> setup() async {
  final prefs = await SharedPreferences.getInstance();
  final db = HfwDatabase(connectDb('hfw.library.1.db', delete: false));
  $.registerSingleton<HfwDatabase>(db);
  const authKey = 'pb_auth';
  final pb = PocketBase(
    'https://hymnsforworship.studio',
    authStore: AsyncAuthStore(
      save: (data) async => prefs.setString(authKey, data),
      initial: prefs.getString(authKey),
      clear: () => prefs.remove(authKey),
    ),
  );
  $.registerSingleton<GetHymnArchive>(GetHymnArchive(db));
  $.registerSingleton<ImportHymn>(ImportHymn(db));
  $.registerSingleton<SharedPreferences>(prefs);
  $.registerSingleton<HfwStudio>(HfwStudio(prefs));
  $.registerSingleton<PocketBase>(pb);
  $.registerSingleton<AuthController>(
    AuthController(client: pb, errorCallback: (error) {}),
    dispose: (e) => e.dispose(),
  );
  $.registerSingleton<GoRouter>(
    createRouter(),
    dispose: (e) => e.dispose(),
  );
  final authController = $.get<AuthController>();
  StreamSubscription? _sync;
  authController.addListener(() async {
    final state = authController.value;
    if (state != null) {
      final (_, model) = state;
      if (model is RecordModel) {
        await db.saveRecordModel(model);
        final uid = model.getStringValue('uid');
        if (uid.isNotEmpty) {
          final legacy = await db.findLegacyRecords(uid).get();
          const userCollections = [
            'playlists',
            'playlist_items',
            'user_library',
            'analytics'
          ];
          for (final item in legacy) {
            if (!userCollections.contains(item.collectionName)) continue;
            final json = jsonDecode(item.data) as Map;
            if (json['user'] != null && json['user'] != '') continue;
            json['user'] = model.id;
            await db.updateRecordModel(
              jsonEncode(json),
              item.deleted,
              false,
              item.updated,
              item.id,
            );
          }
        }
        _sync?.cancel();
        _sync = db.getUnsyncedUserRecords().watch().listen((records) async {
          for (final record in records) {
            final col = pb.collection(record.collectionName);
            final str = jsonDecode(record.data) as Map<String, dynamic>;
            try {
              final model = await col.update(record.id, body: str);
              await db.saveRecordModel(model, deleted: record.deleted);
            } on ClientException catch (err) {
              if (err.statusCode == 404) {
                final model = await col.create(body: str);
                await db.saveRecordModel(model, deleted: record.deleted);
              }
            } catch (e) {
              debugPrint('Error syncing record: $e');
            }
          }
        });
      }
    }
  });
}
