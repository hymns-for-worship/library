import 'dart:async';
import 'dart:typed_data';

import 'package:http/http.dart';
import '../../data/source/database/database.dart';
import '../../data/source/pocketbase/client.dart';
import 'import_hymn.dart';

class DownloadHymn {
  final HfwDatabase db;
  final Client http;
  final HfwStudio client;
  late final importHymn = ImportHymn(db);

  DownloadHymn({
    required this.db,
    required this.client,
    required this.http,
  });

  Stream<double> call(String hymnId) async* {
    yield 0.1;
    // Check for existing download
    final bundle = await db.getBundlesByHymnId(hymnId).getSingleOrNull();
    if (bundle != null) {
      yield 0.4;
      if (bundle.bytes != null) {
        await importHymn(bundle.bytes!);
      }
      yield 1.0;
      return;
    }
    int total = 0;
    int current = 0;
    final results = await client
        .collection('bundles')
        .getList(filter: "hymn_id = '$hymnId'");
    yield 0.3;
    if (results.items.isEmpty) {
      throw Exception('Bundle not found for $hymnId');
    }
    final result = results.items.first;
    final uri = client.getFileUrl(result, result.getStringValue('file'));
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
      await db.createBundle(
        hymnId,
        result.getStringValue('hash'),
        bytes,
        DateTime.parse(result.created),
        DateTime.parse(result.updated),
      );
    } else {
      throw Exception(
        'Error downloading bundle for $hymnId ${response.statusCode}}',
      );
    }
    yield 1;
  }
}
