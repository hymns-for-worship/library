import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/pptx/presentation.dart';
import '../../../model/template_options.dart';
import 'export_playlist.dart';

class ExportPlaylistPptx {
  final HfwDatabase db;
  final TemplateOptions options;

  late final exporter = ExportPlaylist(db, options);
  ExportPlaylistPptx(this.db, this.options);

  Future<void> call(
    String userId,
    Playlist playlist,
    String template, {
    bool saveAs = false,
  }) async {
    final items = await db.getPlaylistItemsForPlaylist(playlist.id).first;
    final slides = await exporter.call(items);
    final bytes = await options.get(template);
    final pres = Presentation.fromBytes(bytes);
    pres.setSlides(slides);
    final outBytes = pres.toBytes();
    if (outBytes == null) {
      throw Exception('Error exporting presentation');
    }
    if (saveAs) {
      await FileSaver.instance.saveAs(
        name: playlist.name,
        bytes: Uint8List.fromList(outBytes),
        ext: 'pptx',
        mimeType: MimeType.microsoftPresentation,
      );
    } else {
      await FileSaver.instance.saveFile(
        name: playlist.name,
        bytes: Uint8List.fromList(outBytes),
        ext: 'pptx',
        mimeType: MimeType.microsoftPresentation,
      );
    }
  }
}
