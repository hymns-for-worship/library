import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:file_saver/file_saver.dart';

import '../../../../data/source/database/database.dart';
import '../../../model/template_options.dart';
import 'export_playlist.dart';

class ExportPlaylistImages {
  final HfwDatabase db;
  final TemplateOptions options;
  late final exporter = ExportPlaylist(db, options);
  ExportPlaylistImages(this.db, this.options);

  Future<void> call(
    String template,
    Playlist playlist, {
    bool saveAs = false,
  }) async {
    final items = await db.getPlaylistItemsForPlaylist(playlist.id).first;
    final slides = await exporter.call(items);
    final filtered = slides //
        .where((e) => e.notes != null && e.background != null)
        .toList();
    final encoder = Archive();
    for (var i = 0; i < filtered.length; i++) {
      final slide = filtered[i];
      final id = i.toString().padLeft(5, '0');
      final bytes = slide.background!;
      final file = ArchiveFile(
        '${id}_${slide.notes!}'.toUpperCase(),
        bytes.length,
        bytes,
      );
      encoder.addFile(file);
    }
    final outBytes = ZipEncoder().encode(encoder);
    if (outBytes == null) {
      throw Exception('Error exporting presentation');
    }
    if (saveAs) {
      await FileSaver.instance.saveAs(
        name: playlist.name,
        bytes: Uint8List.fromList(outBytes),
        ext: 'zip',
        mimeType: MimeType.zip,
      );
    } else {
      await FileSaver.instance.saveFile(
        name: playlist.name,
        bytes: Uint8List.fromList(outBytes),
        ext: 'zip',
        mimeType: MimeType.zip,
      );
    }
  }
}
