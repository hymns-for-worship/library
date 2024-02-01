import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';
import '../../../data/source/database/database.dart';
import '../../../data/source/pocketbase/client.dart';
import '../import_hymn.dart';
import 'get_downloads.dart';

class DownloadHymn {
  final HfwDatabase db;
  final HfwStudio client;
  final Client http;
  late final importHymn = ImportHymn(db);

  DownloadHymn({
    required this.db,
    required this.client,
    required this.http,
  });

  Stream<double> call(
    String hymnId, {
    bool check = false,
  }) async* {
    yield 0.1;
    final existing = await db.getBundlesByHymnId(hymnId).get();
    if (check) {
      //  Check for existing download
      final bundle = await db.getBundlesByHymnId(hymnId).getSingleOrNull();
      if (bundle != null) {
        yield 0.5;
        if (bundle.bytes != null) {
          await importHymn(bundle.bytes!);
        }
        yield 1.0;
        return;
      }
    }
    int total = 0;
    int current = 0;
    final col = client.collection(GetHymnDownloads.collection);
    final results = await col.getList(filter: "id = '$hymnId'");
    yield 0.2;
    if (results.items.isEmpty) {
      throw Exception('Hymn not found: $hymnId');
    }
    final result = results.items.first;
    await db.setRecordModel(jsonEncode(result.toJson()), true, false);
    final hash = result.getStringValue('download_hash');
    if (existing.any((e) => e.hash == hash)) {
      if (existing.length > 1) {
        await db.transaction(() async {
          for (final item in existing) {
            if (item.hash != hash) {
              await db.deleteBundle(item.id);
            }
          }
        });
      }
      yield 1.0;
      return;
    }
    final link = result.getStringValue('download_link');
    if (link.isEmpty) {
      throw Exception('Link not provided for hymn: $hymnId');
    }
    final uri = Uri.parse(link);
    // final preflight = await http.send(Request('HEAD', uri));
    final response = await http.send(Request('GET', uri));
    if (response.statusCode == 200) {
      total = response.contentLength ?? 0;
      current = 0;
      final list = <int>[];
      await for (final event in response.stream) {
        current += event.length;
        yield current / total * 0.6 + 0.3;
        list.addAll(event);
      }
      final bytes = Uint8List.fromList(list);
      await importHymn(bytes);
      await db.transaction(() async {
        if (existing.isNotEmpty) {
          for (final item in existing) {
            await db.deleteBundle(item.id);
          }
        }
        await db.createBundle(
          hymnId,
          hash,
          bytes,
          DateTime.parse(result.created),
          DateTime.parse(result.updated),
        );
      });
    } else {
      throw Exception(
        'Error downloading hymn: $hymnId ${response.statusCode}}',
      );
    }
    yield 1;
  }
}
