import 'dart:typed_data';

import 'package:archive/archive.dart';

import 'bundle_file.dart';

class HymnArchive {
  final Uint8List bytes;
  final Archive archive;
  final String hymnId;

  HymnArchive({
    required this.archive,
    required this.bytes,
    required this.hymnId,
  });

  BundleFile? findFile(bool Function(ArchiveFile) test) {
    final results = findFiles(test);
    return results.firstOrNull;
  }

  List<BundleFile> findFiles(bool Function(ArchiveFile) test) {
    final files = archive.files.where(test);
    return files.map((file) {
      final bytes = file.content as List<int>;
      return BundleFile(
        path: file.name,
        data: Uint8List.fromList(bytes),
      );
    }).toList();
  }
}
