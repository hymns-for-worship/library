import 'dart:async';
import 'dart:typed_data';

import 'package:collection/collection.dart';
import 'package:http/http.dart';
import '../../../data/source/database/database.dart';
import '../../../data/source/pocketbase/client.dart';
import '../import_hymn.dart';
import 'get_versions.dart';

class DownloadHymn {
  final HfwDatabase db;
  final HfwStudio client;
  final Client http;
  // TODO: Import hymn links
  late final importHymn = ImportHymn(db.storage);

  DownloadHymn({
    required this.db,
    required this.client,
    required this.http,
  });

  Stream<double> call(String hymnId, HymnalVersions versions) async* {
    yield 0.1;
    final file = db.storage.io.file('downloads/bundles/$hymnId.zip');
    final existing = await file.metadata();
    final version = versions.hymns.firstWhereOrNull((e) => e.id == hymnId);
    // if (check) {
    //   //  Check for existing download
    //   final bundle = await db.getBundlesByHymnId(hymnId).getSingleOrNull();
    //   if (bundle != null) {
    //     yield 0.5;
    //     if (bundle.bytes != null) {
    //       await importHymn(bundle.bytes!);
    //     }
    //     yield 1.0;
    //     return;
    //   }
    // })
    int total = 0;
    int current = 0;
    // final col = client.collection('hymns');
    // final results = await col.getList(filter: "id = '$hymnId'");
    // yield 0.2;
    // if (results.items.isEmpty) {
    //   throw Exception('Hymn not found: $hymnId');
    // }
    // final result = results.items.first;
    // await db.setRecordModel(jsonEncode(result.toJson()), true, false);
    // final hash = result.getStringValue('download_hash');
    print(('DOWNLOAD', existing, version));
    if (existing != null && version != null && existing.hash == version.hash) {
      yield 1.0;
      return;
    }
    final link = version?.link ?? '';
    if (link.isEmpty) {
      await db.deleteHymn(hymnId);
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
      // await importHymn(bytes);
      await importHymn(bytes);
      await file.writeAsBytes(bytes);
    } else {
      throw Exception(
        'Error downloading hymn: $hymnId ${response.statusCode}}',
      );
    }
    yield 1;
  }
}
