import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/pptx/presentation.dart';
import '../../../model/template_options.dart';
import 'export_playlist.dart';

class ExportPlaylistPptx {
  final HfwDatabase db;
  final TemplateOptions options;
  final PlaylistAssetLoader loadAsset;
  late final exporter = ExportPlaylist(db, options, loadAsset);
  ExportPlaylistPptx(this.db, this.options, this.loadAsset);

  Future<void> call(
    String userId,
    Playlist playlist,
    Playlist data,
    String template,
  ) async {
    final items = await db.getItemsForPlaylist(userId, data.id).get();
    final slides = await exporter.call(items);
    final bytes = await options.get(template);
    final pres = Presentation.fromBytes(bytes);
    pres.setSlides(slides);
    final outBytes = pres.toBytes();
    if (outBytes == null) {
      throw Exception('Error exporting presentation');
    }
    await FileSaver.instance.saveFile(
      name: playlist.name,
      bytes: Uint8List.fromList(outBytes),
      ext: 'pptx',
      mimeType: MimeType.microsoftPresentation,
    );
  }
}
