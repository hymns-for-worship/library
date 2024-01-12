import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:file_saver/file_saver.dart';

import '../../../../data/source/database/database.dart';
import '../../../model/template_options.dart';
import 'export_playlist.dart';

class ExportImagesImages {
  final HfwDatabase db;
  final TemplateOptions options;
  late final exporter = ExportPlaylist(db, options);
  ExportImagesImages(this.db, this.options);

  Future<void> call(
    String template,
    Playlist playlist,
    List<PlaylistItem> items,
  ) async {
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
    await FileSaver.instance.saveFile(
      name: playlist.name,
      bytes: Uint8List.fromList(outBytes),
      ext: 'zip',
      mimeType: MimeType.zip,
    );
  }
}
