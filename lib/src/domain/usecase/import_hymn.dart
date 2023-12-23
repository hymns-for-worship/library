import 'package:crypto/crypto.dart';
import 'package:drift/drift.dart';
import 'package:xml/xml.dart';

import '../../data/source/archive/zip.dart';
import '../../data/source/database/database.dart';

// <?xml version="1.0" encoding="utf-8" standalone="yes"?>
// <contents xmlns="http://schema.PresentationCreator.net/HymnalInformation.xsd">
//   <hymnal key="SDF5QW0ybmJzMyBDRjRvZHI1IEVXNm9mcjdzR2g4aWhwOSBJUzB1anBhcEJsY2VEbWVlRm5ndEhIaUZKV2tTSzBsLUw5bTZNMm4wTjZvMU81cC1QMHEtUTZyUnM=" guid="d886fbb1-9030-4ada-96ec-9a14bade5f9a" sku="HFWS" xmlns="http://schema.PresentationCreator.net/HymnalInformation.xsd">
//     <name>Hymns For Worship Supplement</name>
//     <alias>HFWS</alias>
//     <ISBN>0-9620615-0-6</ISBN>
//     <hymnalId>2</hymnalId>
//     <electronicVersion>1.5.518.5156</electronicVersion>
//     <hymn number="1002" title="Higher Ground" key="SDF5QW0ybmJzMyBDRjRvZHI1IEVXNm9mcjdzR2g4aWhwOSBJUzB1anBhcEJsY2VEbWVlRm5ndEhIaUZKV2tTSzBsLUw5bTZNMm4wTjZvMU81cC1QMHEtUTZyUnM=" hymnId="715" sku="rjsec1002">
//       <electronicVersion>1.5.518.5156</electronicVersion>
//       <tuneName></tuneName>
//       <songLeaderInfo beatPattern="4" key="A" startingPitch="SOL" time="4/4" startingBeat="3+" startingPitchDirection="Down" />
//       <printSmallPortable>1002\1002 - Higher Ground - Print Small.PDF</printSmallPortable>
//       <printLargePortable>1002\1002 - Higher Ground - Print Large.PDF</printLargePortable>
//       <originator name="Gabriel, Charles H." role="Composer" type="Individual" stakeHolderId="188" />
//       <originator name="Hallal Music" role="Copyright Holder" type="Business" stakeHolderId="468" />
//       <originator name="Oatman, Johnson  Jr." role="Lyricist" type="Individual" stakeHolderId="708" />
//       <scripture>Philippians 3:14</scripture>
//       <topicalIndex>Aspiration</topicalIndex>
//       <topicalIndex>Reward</topicalIndex>
//       <hymnPortion portion="Verse 1" hymnPortionId="2808">
//         <text>I'm pressing on the upward way, new heights I'm gaining every day; Still praying as I onward bound, Lord, plant my feet on higher ground.</text>
//       </hymnPortion>
//       <hymnPortion portion="Verse 2" hymnPortionId="2809">
//         <text>My heart has no desire to stay where doubts arise and fears dismay. Tho' some may dwell where these abound, my prayer my aim is higher ground.</text>
//       </hymnPortion>
//       <hymnPortion portion="Verse 3" hymnPortionId="2810">
//         <text>I want to scale the utmost height, and catch a gleam of glory bright. But still I'll pray till heav'n I've found; Lord, lead me on to higher ground.</text>
//       </hymnPortion>
//       <hymnPortion portion="Chorus" hymnPortionId="7423">
//         <text>Lord, lift me up and let me stand, by faith on heaven's table land. A higher plane than I have found; Lord, plant my feet on higher ground.</text>
//       </hymnPortion>
//     </hymn>
//   </hymnal>
// </contents>
class ImportHymn {
  final HfwDatabase db;
  ImportHymn(this.db);

  Future<void> call(Uint8List bytes) async {
    await db.transaction(() async {
      final archive = await extractZipAsync(bytes);

      final hash = sha256.convert(bytes).toString();
      final bundle = await db.getBundleByHash(hash).getSingleOrNull();
      if (bundle != null) {
        return;
      }

      final now = DateTime.now();

      final infos = archive //
          .files
          .where((e) => e.name.endsWith('Information.hixml'));
      if (infos.isEmpty) {
        throw Exception('No information.hixml file found');
      }
      final infoBytes = infos.first.content as List<int>;
      final str = String.fromCharCodes(infoBytes);

      final (hymnId, _) = await parseHymnInformationFile(db, str);

      await db.createBundle(
        hymnId,
        hash,
        bytes,
        now,
        now,
      );
    });
  }

  Future<(String, String)> parseHymnInformationFile(
    HfwDatabase db,
    String str,
  ) async {
    final doc = XmlDocument.parse(str);
    final content = doc.findAllElements('contents').first;
    final version = int.tryParse(content.attr('version')) ?? 0;
    if (version < 2) {
      throw Exception('Unsupported version: $version');
    }
    final now = DateTime.now();
    final hymn = doc.findAllElements('hymn').first;
    final hymnal = doc.findAllElements('hymnal').first;
    final number = hymn.attr('number');
    String hymnId;

    {
      // Hymn
      final notation = hymn.findAllElements('songLeaderInfo').first;
      final results = await db.createHymn(
        hymn.attr('id'),
        hymn.attr('title'),
        number,
        hymn.findAllElements('tuneName').firstOrNull?.innerText ?? '',
        notation.attr('key'),
        notation.attr('beatPattern'),
        notation.attr('startingPitch'),
        notation.attr('startingBeat'),
        notation.attr('startingPitchDirection'),
        notation.attr('time'),
        notation.attr('complexTime'),
        now,
        now,
      );
      hymnId = results.first.id;
    }

    {
      // Hymnal
      final results = await db.createHymnal(
        hymnal.attr('id'),
        hymnal.findAllElements('name').first.innerText,
        hymnal.findAllElements('alias').first.innerText,
        now,
        now,
      );
      await db.createHymnHymnal(
        results.first.id,
        hymnId,
        now,
        now,
      );
    }
    {
      // Topics
      for (final node in doc.findAllElements('topicalIndex')) {
        final results = await db.createTopic(
          node.attr('id'),
          node.innerText,
          now,
          now,
        );
        await db.createHymnTopic(
          results.first.id,
          hymnId,
          now,
          now,
        );
      }
    }
    {
      // Scriptures
      for (final node in doc.findAllElements('scripture')) {
        final results = await db.createScripture(
          node.attr('id'),
          node.innerText,
          now,
          now,
        );
        await db.createHymnScripture(
          results.first.id,
          hymnId,
          now,
          now,
        );
      }
    }
    {
      // Portions
      for (final node in doc.findAllElements('hymnPortion')) {
        final results = await db.createPortion(
          node.attr('id'),
          node.attr('portion'),
          node.findAllElements('text').map((e) => e.innerText).join('\n'),
          node.attr('hymnPortionId'),
          now,
          now,
        );
        await db.createHymnPortion(
          results.first.id,
          hymnId,
          now,
          now,
        );
      }
    }
    {
      // Stakeholders
      for (final node in doc.findAllElements('originator')) {
        final results = await db.createStakeholder(
          node.attr('stakeHolderId'),
          node.attr('name'),
          now,
          now,
        );
        await db.createHymnStakeholder(
          results.first.id,
          hymnId,
          node.attr('role'),
          now,
          now,
        );
      }
    }

    return (hymnId, number);
  }
}

extension on XmlElement {
  String attr(String key) {
    final value = getAttribute(key) ?? '';
    return value.trim();
  }
}
