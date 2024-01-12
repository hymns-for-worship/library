import 'dart:typed_data';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/pptx/presentation.dart';
import '../../../model/template_options.dart';

class ExportPlaylist {
  final HfwDatabase db;
  final TemplateOptions options;

  ExportPlaylist(this.db, this.options);

  Future<List<PresentationSlide>> call(List<PlaylistItem> items) async {
    final slides = <PresentationSlide>[];
    var itemIdx = 0;
    for (final item in items) {
      if (item.text != null || item.black != null) {
        Uint8List? background;
        if (item.black != null) {
          final color = item.black! ? 'Black' : 'White';
          final black = await options.get('assets/templates/$color.png');
          background = black.buffer.asUint8List();
        }
        slides.add((
          name: '',
          background: background,
          text: item.text ?? '',
          notes: '',
          footer: '',
          invertText: item.black == true,
          metadata: {'index': itemIdx},
        ));
      } else if (item.hymnId != null && item.hymnId!.isNotEmpty) {
        final hymn = await db.getHymn(item.hymnId!).getSingleOrNull();
        if (hymn == null) continue;
        final bundle = await db.getBundlesByHymnId(hymn.id).getSingleOrNull();
        if (bundle == null || bundle.bytes == null) continue;
        final archive = await bundle.toArchiveAsync();
        if (archive == null) continue;
        final images = archive.files.where((e) => e.name.endsWith('.png'));
        final parts = item.parts;
        if (parts.isNotEmpty && parts[0].toUpperCase() != 'TITLE') {
          parts.insert(0, 'Title');
        }
        var partIdx = 0;
        for (final part in parts) {
          var footer = '';
          final related = images
              .where((e) =>
                  e.name.toUpperCase().contains('- ${part.toUpperCase()}'))
              .toList();
          related.sort((a, b) => a.name.compareTo(b.name));
          var idx = 0;
          for (final asset in related) {
            if (idx == related.length - 1) {
              footer = 'End of $part';
              if (partIdx == parts.length - 1) {
                footer = 'End of Song';
              }
              if (part.toLowerCase() == 'title') {
                footer = '';
              }
            }
            final bytes = asset.content as List<int>;
            final buffer = Uint8List.fromList(bytes);
            slides.add((
              name: '${hymn.number} - ${hymn.title}',
              background: buffer,
              text: item.text ?? '',
              notes: asset.name,
              footer: footer,
              invertText: false,
              metadata: {'index': itemIdx},
            ));
            idx++;
          }
          partIdx++;
        }
      }
      itemIdx++;
    }
    return slides;
  }
}

extension PlaylistItemItems on PlaylistItem {
  bool? get black {
    final color = this.color ?? '';
    if (color.toLowerCase() == 'black') {
      return true;
    }
    if (color == '#000000' || color == '000000') {
      return true;
    }
    return null;
  }
}
