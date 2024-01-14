import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:xml/xml.dart';

import '../../../../data/source/database/database.dart';
import '../../../model/playlist_item.dart';
import '../../../model/template_options.dart';
import 'export_playlist.dart';

class ExportPlaylistHtml {
  final HfwDatabase db;
  final TemplateOptions options;
  late final exporter = ExportPlaylist(db, options);
  ExportPlaylistHtml(this.db, this.options);

  Future<void> call(
    String userId,
    Playlist playlist, {
    bool saveAs = false,
  }) async {
    final items = await db.getPlaylistItemsForPlaylist(playlist.id).first;
    final xml = baseTemplate(await createTable(
      version: 'v3',
      items: items,
    ));
    final str = XmlDocument.parse(xml).toXmlString(pretty: true);

    if (saveAs) {
      await FileSaver.instance.saveAs(
        name: playlist.name,
        bytes: Uint8List.fromList(str.codeUnits),
        ext: 'html',
        mimeType: MimeType.text,
      );
    } else {
      await FileSaver.instance.saveFile(
        name: playlist.name,
        bytes: Uint8List.fromList(str.codeUnits),
        ext: 'html',
        mimeType: MimeType.text,
      );
    }
  }

  String baseTemplate(String body) {
    return '''
    <html>
      <head>
        <link rel='stylesheet' href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css' integrity='sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T' crossorigin='anonymous'>
      </head>
      <body class='container-fluid'>
        <h1>Selected Hymns</h1>
        $body
      </body>
    </html>
    ''';
  }

  Future<String> createTable({
    required String version,
    required List<PlaylistItem> items,
  }) async {
    final src = '''
    <table class="table table-striped table-bordered">
      <thead class="thead-dark">
        <tr>
          <th class="text-center">Hymnal</th>
          <th class="text-right">#</th>
          <th class="text-center">Pitch</th>
          <th class="text-center">Syl</th>
          <th class="text-center">Dir</th>
          <th class="text-center">Time</th>
          <th class="text-center">1st Beat</th>
          <th>Title</th>
          <th>Verses</th>
        </tr>
      </thead>
      <tbody>
      </tbody>
      <tfoot>
        <tr>
          <td colspan="9">
            <span>${DateTime.now().toIso8601String()}</span>
            <span class="float-right"
              >Presentation Creator $version</span
            >
          </td>
        </tr>
      </tfoot>
    </table>
    ''';
    final xml = XmlDocument.parse(src);
    final body = xml.findAllElements('tbody').first;
    for (final item in items //
        .where((e) => e.hymnId != null && e.hymnId!.isNotEmpty)
        .toList()) {
      XmlElement cell(String align, String value) {
        return XmlElement.tag(
          'td',
          attributes: [
            if (align.isNotEmpty) ...[
              XmlAttribute(XmlName.fromString('class'), 'text-$align'),
            ],
          ],
          children: [XmlText(value)],
        );
      }

      final hymn = await db.getHymn(item.hymnId!).getSingleOrNull();
      if (hymn == null) continue;
      final hymnal = await db.getHymnalsByHymnId(hymn.id).getSingleOrNull();
      body.children.add(XmlElement.tag('tr', children: [
        cell('center', hymnal?.name ?? 'N/A'),
        cell('right', hymn.number),
        cell('center', hymn.startingKey ?? 'N/A'),
        cell('center', hymn.startingPitch ?? 'N/A'),
        cell('center', hymn.startingPitchDirection ?? 'N/A'),
        cell('center', hymn.timeSignature ?? 'N/A'),
        cell('center', hymn.startingBeat ?? 'N/A'),
        cell('', hymn.title),
        cell('', item.parts.join(',')),
      ]));
    }
    return xml.toXmlString();
  }
}
