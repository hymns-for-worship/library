import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:hfw_core/src/domain/model/defaults.dart';
import 'package:sqlite_storage/sqlite_storage.dart';

import '../../../../data/source/database/database.dart';
import '../../../../data/source/pptx/presentation.dart';
import '../../../model/hymn_archive.dart';
import '../../../model/playlist_item.dart';
import '../../../model/template_options.dart';

class ExportPlaylist {
  final HfwDatabase db;
  final DriftStorage storage;
  final TemplateOptions options;

  ExportPlaylist(this.db, this.storage, this.options);

  Future<List<PresentationSlide>> call(
    List<PlaylistItem> items, {
    bool firstAndLast = false,
    bool chorusOnlyOnce = false,
    bool autoAddChorus = true,
  }) async {
    final slides = <PresentationSlide>[];
    var itemIdx = 0;
    for (final item in items) {
      if (item.text.valid || item.black != null) {
        Uint8List? background;
        final color = item.black == true ? 'Black' : 'White';
        final black = await options.getRaw('assets/templates/$color.png');
        background = black.buffer.asUint8List();
        slides.add((
          name: '',
          background: background,
          text: item.text ?? '',
          notes: '',
          footer: '',
          invertText: item.black == true,
          metadata: {'index': itemIdx},
        ));
      } else if (item.hymnId.valid) {
        final hymn = await db.getHymn(item.hymnId!).getSingleOrNull();
        if (hymn == null) continue;
        final bytes = await storage.io
            .file('downloads/bundles/${hymn.id}.zip')
            .readAsBytes();
        if (bytes == null) continue;
        final hymnArchive = HymnArchive(
          archive: ZipDecoder().decodeBytes(bytes),
          hymnId: hymn.id,
        );
        final images = hymnArchive //
            .archive
            .files
            .where((e) => e.name.endsWith('.png'));
        var parts = item.parts;
        if (parts.isEmpty) {
          final portions = await db.getPortionsByHymnId(item.hymnId!).get();
          parts = portions.defaults(
            firstAndLast: firstAndLast,
            chorusOnlyOnce: chorusOnlyOnce,
            autoAddChorus: autoAddChorus,
          );
        }
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

extension on String? {
  bool get valid => this != null && this!.isNotEmpty;
}
