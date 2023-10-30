import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:xml/xml.dart';

import '../../data/repository/assets.dart';
import '../../data/repository/hymn_hymnals.dart';
import '../../data/repository/hymn_portions.dart';
import '../../data/repository/hymn_scriptures.dart';
import '../../data/repository/hymn_stakeholders.dart';
import '../../data/repository/hymn_topics.dart';
import '../../data/repository/hymns.dart';
import '../../data/repository/hymnals.dart';
import '../../data/repository/portions.dart';
import '../../data/repository/scriptures.dart';
import '../../data/repository/stakeholders.dart';
import '../../data/repository/topics.dart';

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
  final TopicsRepository topics;
  final HymnTopicsRepository hymnTopics;
  final ScripturesRepository scriptures;
  final HymnScripturesRepository hymnScriptures;
  final HymnsRepository hymns;
  final HymnalsRepository hymnals;
  final HymnHymnalsRepository hymnHymnals;
  final PortionsRepository portions;
  final StakeholdersRepository stakeholders;
  final HymnStakeholdersRepository hymnStakeholders;
  final HymnPortionsRepository hymnPortions;
  final AssetsRepository assets;

  ImportHymn({
    required this.topics,
    required this.hymnTopics,
    required this.scriptures,
    required this.hymnScriptures,
    required this.hymnals,
    required this.hymnHymnals,
    required this.portions,
    required this.hymns,
    required this.stakeholders,
    required this.hymnStakeholders,
    required this.hymnPortions,
    required this.assets,
  });

  String? execute(Uint8List bytes, {bool addAssets = true}) {
    final decoder = ZipDecoder();
    final archive = decoder.decodeBytes(bytes);
    String? id;

    final infos = archive //
        .files
        .where((e) => e.name.endsWith('Information.hixml'));
    if (infos.isEmpty) {
      throw Exception('No information.hixml file found');
    }
    final infoBytes = infos.first.content as List<int>;
    final str = String.fromCharCodes(infoBytes);
    final (hymnId, hymnNumber) = parseInfo(str);
    id = hymnNumber;

    if (addAssets) {
      for (final file in archive.files) {
        if (file.isFile) {
          final bytes = file.content as List<int>;
          assets.add((
            hymnId,
            file.name,
            Uint8List.fromList(bytes),
          ));
        }
      }
      // TODO: Need to add app PNGs for sheet music and PDFs/PPTX
      hymns.setDownloaded(
        hymnId,
        true,
        DateTime.now(),
      );
    }

    return id;
  }

  (int, String) parseInfo(String str) {
    final doc = XmlDocument.parse(str);
    final hymn = doc.findAllElements('hymn').first;
    final hymnal = doc.findAllElements('hymnal').first;
    int hymnId;
    final number = hymn.getAttribute('number')!;

    {
      // Hymn
      final notation = hymn.findAllElements('songLeaderInfo').first;
      hymnId = hymns.add((
        title: hymn.getAttribute('title')!,
        number: number,
        tuneName: hymn.findAllElements('tuneName').firstOrNull?.innerText ?? '',
        startingKey: notation.getAttribute('key'),
        beatPattern: notation.getAttribute('beatPattern'),
        startingPitch: notation.getAttribute('startingPitch'),
        startingBeat: notation.getAttribute('startingBeat'),
        startingPitchDirection: notation.getAttribute('startingPitchDirection'),
        timeSignature: notation.getAttribute('time'),
        complexTimeSignature: notation.getAttribute('complexTime'),
        downloaded: false,
      ));
    }

    {
      // Hymnal
      final id = hymnals.add((
        hymnal.findAllElements('name').first.innerText,
        hymnal.findAllElements('alias').first.innerText,
      ));
      hymnHymnals.add((hymnId, id));
    }
    {
      // Topics
      for (final node in doc.findAllElements('topicalIndex')) {
        final id = topics.add(node.innerText);
        hymnTopics.add((hymnId, id));
      }
    }
    {
      // Scriptures
      for (final node in doc.findAllElements('scripture')) {
        final id = scriptures.add(node.innerText);
        hymnScriptures.add((hymnId, id));
      }
    }
    {
      // Portions
      for (final node in doc.findAllElements('hymnPortion')) {
        final id = portions.add((
          node.getAttribute('portion')!,
          node.findAllElements('text').map((e) => e.innerText).join('\n'),
          node.getAttribute('hymnPortionId')!,
        ));
        hymnPortions.add((hymnId, id));
      }
    }
    {
      // Stakeholders
      for (final node in doc.findAllElements('originator')) {
        final id = stakeholders.add(
          node.getAttribute('name')!,
        );
        hymnStakeholders.add((
          hymnId,
          id,
          node.getAttribute('role')!,
        ));
      }
    }

    return (hymnId, number);
  }

  // void copyImages(int hymnId, String number) {
  //   final related = assets.getAssetForHymnId(hymnId);
  //   for (final file in related.where((e) => e.path.contains('PresentationCreator') && !e.path.endsWith('Information.hixml'))) {
  //     if (file.path.contains('- Print ')) {
  //       final size = file.path.contains('Print Large') ? 'large' : 'small';
  //       final id = sheetMusic.addSheetMusic(file.path, size, 0, file.id);
  //       sheetMusic.addHymnSheetMusic(hymnId, id);
  //     } else {
  //       final parts = file.path.split('.');
  //       final title = file.path.endsWith('Title.png');
  //       int order = title ? 0 : int.parse(parts[parts.length - 2]);
  //       String target = title ? 'Title' : parts[parts.length - 3].toLowerCase();
  //       final idx = target.lastIndexOf('-');
  //       if (idx != -1) {
  //         target = target.substring(idx + 1, target.length).trim();
  //       }

  //       final id = slides.addSlides(file.path, target.toLowerCase(), order, file.id);
  //       final hymnPortions = portions.getPortionsForHymn(hymnId);
  //       final matchIdx = hymnPortions.indexWhere((e) => e.portion.toLowerCase() == target);
  //       final match = matchIdx == -1 ? null : hymnPortions[matchIdx];
  //       slides.addHymnSlides(hymnId, id, match?.id);
  //     }
}
