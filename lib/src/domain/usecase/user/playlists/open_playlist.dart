import 'package:collection/collection.dart';
import 'package:file_picker/file_picker.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:xml/xml.dart';

import 'add_hymn_to_playlist.dart';
import 'add_text_to_playlist.dart';

// <?xml version="1.0" encoding="utf-8" standalone="yes"?>
// <dsHymns xmlns="http://tempuri.org/dsHymns.xsd">
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1072</Number>
//     <Title>Hilltops Of Glory</Title>
//     <VerseNumber>1</VerseNumber>
//     <Description>Verse 1</Description>
//     <RowNumber>0</RowNumber>
//     <Association>Hymns For Worship Supplement  1072 - Hilltops Of Glory  1</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1072</Number>
//     <Title>Hilltops Of Glory</Title>
//     <VerseNumber>C</VerseNumber>
//     <Description>Chorus</Description>
//     <RowNumber>1</RowNumber>
//     <Association>Hymns For Worship Supplement  1072 - Hilltops Of Glory  C</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1072</Number>
//     <Title>Hilltops Of Glory</Title>
//     <VerseNumber>2</VerseNumber>
//     <Description>Verse 2</Description>
//     <RowNumber>2</RowNumber>
//     <Association>Hymns For Worship Supplement  1072 - Hilltops Of Glory  2</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1072</Number>
//     <Title>Hilltops Of Glory</Title>
//     <VerseNumber>C</VerseNumber>
//     <Description>Chorus</Description>
//     <RowNumber>3</RowNumber>
//     <Association>Hymns For Worship Supplement  1072 - Hilltops Of Glory  C</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1072</Number>
//     <Title>Hilltops Of Glory</Title>
//     <VerseNumber>3</VerseNumber>
//     <Description>Verse 3</Description>
//     <RowNumber>4</RowNumber>
//     <Association>Hymns For Worship Supplement  1072 - Hilltops Of Glory  3</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1072</Number>
//     <Title>Hilltops Of Glory</Title>
//     <VerseNumber>C</VerseNumber>
//     <Description>Chorus</Description>
//     <RowNumber>5</RowNumber>
//     <Association>Hymns For Worship Supplement  1072 - Hilltops Of Glory  C</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1002</Number>
//     <Title>Higher Ground</Title>
//     <VerseNumber>1</VerseNumber>
//     <Description>Verse 1</Description>
//     <RowNumber>6</RowNumber>
//     <Association>Hymns For Worship Supplement  1002 - Higher Ground  1</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1002</Number>
//     <Title>Higher Ground</Title>
//     <VerseNumber>C</VerseNumber>
//     <Description>Chorus</Description>
//     <RowNumber>7</RowNumber>
//     <Association>Hymns For Worship Supplement  1002 - Higher Ground  C</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1002</Number>
//     <Title>Higher Ground</Title>
//     <VerseNumber>2</VerseNumber>
//     <Description>Verse 2</Description>
//     <RowNumber>8</RowNumber>
//     <Association>Hymns For Worship Supplement  1002 - Higher Ground  2</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1002</Number>
//     <Title>Higher Ground</Title>
//     <VerseNumber>C</VerseNumber>
//     <Description>Chorus</Description>
//     <RowNumber>9</RowNumber>
//     <Association>Hymns For Worship Supplement  1002 - Higher Ground  C</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1002</Number>
//     <Title>Higher Ground</Title>
//     <VerseNumber>3</VerseNumber>
//     <Description>Verse 3</Description>
//     <RowNumber>10</RowNumber>
//     <Association>Hymns For Worship Supplement  1002 - Higher Ground  3</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal />
//     <Number />
//     <Title>&lt;none&gt;</Title>
//     <VerseNumber>B</VerseNumber>
//     <Description />
//     <RowNumber>11</RowNumber>
//     <Association>   - &lt;none&gt;  B</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal />
//     <Number />
//     <Title>Hello</Title>
//     <VerseNumber>B</VerseNumber>
//     <Description />
//     <RowNumber>12</RowNumber>
//     <Association>   - Hello  B</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1143</Number>
//     <Title>More Precious Than Silver</Title>
//     <VerseNumber>1</VerseNumber>
//     <Description>Verse 1</Description>
//     <RowNumber>13</RowNumber>
//     <Association>Hymns For Worship Supplement  1143 - More Precious Than Silver  1</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1146</Number>
//     <Title>The Great Commission</Title>
//     <VerseNumber>1</VerseNumber>
//     <Description>Verse 1</Description>
//     <RowNumber>14</RowNumber>
//     <Association>Hymns For Worship Supplement  1146 - The Great Commission  1</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1146</Number>
//     <Title>The Great Commission</Title>
//     <VerseNumber>2</VerseNumber>
//     <Description>Verse 2</Description>
//     <RowNumber>15</RowNumber>
//     <Association>Hymns For Worship Supplement  1146 - The Great Commission  2</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1146</Number>
//     <Title>The Great Commission</Title>
//     <VerseNumber>3</VerseNumber>
//     <Description>Verse 3</Description>
//     <RowNumber>16</RowNumber>
//     <Association>Hymns For Worship Supplement  1146 - The Great Commission  3</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
//   <SelectedHymnVerseTable>
//     <Hymnal>Hymns For Worship Supplement</Hymnal>
//     <Number>1146</Number>
//     <Title>The Great Commission</Title>
//     <VerseNumber>C</VerseNumber>
//     <Description>Chorus</Description>
//     <RowNumber>17</RowNumber>
//     <Association>Hymns For Worship Supplement  1146 - The Great Commission  C</Association>
//     <SlideText></SlideText>
//   </SelectedHymnVerseTable>
// </dsHymns>
class OpenPlaylist {
  final HfwDatabase db;
  OpenPlaylist(this.db);

  late final editPlaylist = EditPlaylist(db);
  late final addHymn = AddHymnToPlaylist(db);
  late final addText = AddTextToPlaylist(db);

  Future<Playlist> call(String userId) async {
    var result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xml'],
      dialogTitle: 'Open Presentation',
      withData: true,
    );
    if (result == null || result.files.isEmpty) {
      throw Exception('No file selected');
    }
    final items = <PlaylistItemData>[];
    final hymns = await db.getHymns().get();
    final str = String.fromCharCodes(result.files.first.bytes!);
    final doc = XmlDocument.parse(str);
    final hymnItems = doc.findAllElements('SelectedHymnVerseTable');
    for (final hymn in hymnItems) {
      final hymnal = hymn.getElement('Hymnal')?.innerText;
      if (hymnal != null && hymnal.isNotEmpty) {
        // Find hymn by title and number
        final title = hymn.getElement('Title')?.innerText ?? '';
        final number = hymn.getElement('Number')?.innerText ?? '';
        final result = hymns.firstWhereOrNull((e) {
          return e.title == title && e.number == number;
        });
        if (result == null) {
          throw Exception('Could not find hymn: $title $number');
        }
        final description = hymn.getElement('Description')?.innerText ?? '';
        if (items.isNotEmpty && items[items.length - 1].hymn?.id == result.id) {
          final parts = items[items.length - 1].parts ?? [];
          parts.add(description);
          items[items.length - 1] = (
            hymn: result,
            parts: parts,
            text: null,
            black: null,
          );
        } else {
          items.add((
            hymn: result,
            parts: [description],
            text: null,
            black: null,
          ));
        }
      } else {
        final verseNumber = hymn.getElement('VerseNumber')?.innerText ?? '';
        final title = hymn.getElement('Title')?.innerText ?? '';
        final hasTitle = title != '&lt;none&gt;';
        final black = verseNumber == 'B';
        items.add((
          hymn: null,
          parts: null,
          text: hasTitle ? title : null,
          black: black,
        ));
      }
    }
    final name = result.files.first.name.split('/').last;
    final now = DateTime.now();
    final data = Playlist(
      id: '',
      user: userId,
      created: now,
      updated: now,
      collectionId: 'playlists',
      collectionName: 'playlists',
      synced: false,
      deleted: false,
      data: '',
      name: name,
    );
    final playlist = await editPlaylist(data, userId);
    for (final item in items) {
      if (item.hymn != null) {
        await addHymn(userId, playlist, item.hymn!, parts: item.parts);
        continue;
      }
      final color = item.black != null
          ? item.black!
              ? '#000000'
              : '#FFFFFF'
          : null;
      if (item.text != null) {
        await addText(userId, playlist, item.text!, color: color);
        continue;
      }
      if (item.black != null) {
        await addText(userId, playlist, '', color: color);
        continue;
      }
    }
    return playlist;
  }
}

typedef PlaylistItemData = ({
  Hymn? hymn,
  List<String>? parts,
  String? text,
  bool? black,
});
