import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:shortid/shortid.dart';
import 'package:xml/xml.dart';

import '../archive/archive_base.dart';

typedef PresentationSlide = ({
  String name,
  bool invertText,
  String? text,
  String? footer,
  String? notes,
  Uint8List? background,
  Map<String, dynamic> metadata,
});

typedef AssetPair = ({
  String xml,
  String xmlRels,
});

class Presentation extends ArchiveBase {
  Presentation(super.archive);

  void reset() {
    if (fallbackImage == null) findFallbackImage();
    if (slideBase == null) findSlideBase();
    if (notesSlideBase == null) findNotesSlideBase();
  }

  factory Presentation.fromBytes(List<int> bytes) {
    final archive = ZipDecoder().decodeBytes(bytes);
    final files = <String, Uint8List>{};
    for (final file in archive.files) {
      final bytes = file.content as List<int>;
      files[file.name] = Uint8List.fromList(bytes);
    }
    final pres = Presentation(files);
    pres.reset();
    return pres;
  }

  Uint8List? fallbackImage;
  AssetPair? slideBase;
  AssetPair? notesSlideBase;

  final ids = <(int, String), String>{};

  static const String notesType =
      "http://schemas.openxmlformats.org/officeDocument/2006/relationships/notesSlide";
  static const String slideType =
      "http://schemas.openxmlformats.org/officeDocument/2006/relationships/slide";
  static const String imageType =
      "http://schemas.openxmlformats.org/officeDocument/2006/relationships/image";
  static const String layoutType =
      "http://schemas.openxmlformats.org/officeDocument/2006/relationships/slideLayout";
  static const String notesLayoutType =
      "http://schemas.openxmlformats.org/officeDocument/2006/relationships/notesMaster";

  void findFallbackImage() {
    // Use last image as fallback
    final images = filter((file) => file.contains('ppt/media/')).toList();
    if (images.isNotEmpty) {
      final bytes = images.last.$2;
      fallbackImage = Uint8List.fromList(bytes);
    }
  }

  void findSlideBase() {
    String? xml, xmlRels;
    {
      // Use first slide as base
      final slides =
          filter((file) => file.endsWith('ppt/slides/slide1.xml')).toList();
      if (slides.isNotEmpty) {
        final bytes = slides.first.$2;
        final raw = String.fromCharCodes(bytes);
        xml = raw;
      }
    }

    {
      // Use first slide as base
      final slides =
          filter((file) => file.endsWith('ppt/slides/_rels/slide1.xml.rels'))
              .toList();
      if (slides.isNotEmpty) {
        final bytes = slides.first.$2;
        final raw = String.fromCharCodes(bytes);
        xmlRels = raw;
      }
    }

    if (xml != null && xmlRels != null) {
      slideBase = (xml: xml, xmlRels: xmlRels);
    }
  }

  void findNotesSlideBase() {
    String? xml, xmlRels;
    {
      // Use first slide as base
      final slides =
          filter((file) => file.contains('ppt/notesSlides/')).toList();
      if (slides.isNotEmpty) {
        final bytes = slides.first.$2;
        final raw = String.fromCharCodes(bytes);
        xml = raw;
      }
    }

    {
      // Use first slide as base
      final slides = filter((file) =>
          file.contains('ppt/notesSlides/_rels/notesSlide1.xml.rels')).toList();
      if (slides.isNotEmpty) {
        final bytes = slides.first.$2;
        final raw = String.fromCharCodes(bytes);
        xmlRels = raw;
      }
    }

    if (xml != null && xmlRels != null) {
      notesSlideBase = (xml: xml, xmlRels: xmlRels);
    }
  }

  void setSlides(List<PresentationSlide> items) {
    assert(fallbackImage != null, 'Missing fallback image');
    assert(slideBase != null, 'Missing slide base');
    // assert(notesSlideBase != null, 'Missing notes slide base');

    // Remove with path ppt/slides/
    removeAll(filter((file) => file.contains('ppt/slides/'))
        .map((file) => file.$1)
        .toList());

    // Remove with path ppt/notesSlides/
    removeAll(filter((file) => file.contains('ppt/notesSlides/'))
        .map((file) => file.$1)
        .toList());

    {
      // Update ppt/presentation.xml
      final file = find((e) => e.endsWith('ppt/presentation.xml'));
      final bytes = file!.$2;
      final raw = String.fromCharCodes(bytes);
      final content = XmlDocument.parse(raw);
      final slides = content.findAllElements('p:sldIdLst').first;
      slides.children.clear();
      var idx = 1;
      var offset = 255;
      for (final _ in items) {
        slides.children.add(XmlElement(XmlName('p:sldId'), [
          XmlAttribute(XmlName('id'), '${++offset}'),
          XmlAttribute(XmlName('r:id'), idFromInt(idx)),
        ]));
        idx++;
      }
      final str = content.toXmlString();
      write(file.$1, str.codeUnits);
    }

    {
      // Update ppt/_rels/presentation.xml.rels
      final file = find((e) => e.endsWith('ppt/_rels/presentation.xml.rels'));
      final bytes = file!.$2;
      final raw = String.fromCharCodes(bytes);
      final content = XmlDocument.parse(raw);
      final relationships = content.findAllElements('Relationships').first;
      // Remove existing type slide
      relationships
          .findAllElements('Relationship')
          .where((e) => e.getAttribute('Type') == slideType)
          .forEach((e) => e.remove());
      // Add new type slide
      var idx = 1;
      for (final _ in items) {
        relationships.children.add(XmlElement(
          XmlName('Relationship'),
          [
            XmlAttribute(XmlName('Id'), idFromInt(idx)),
            XmlAttribute(XmlName('Type'), slideType),
            XmlAttribute(XmlName('Target'), '/ppt/slides/slide$idx.xml'),
          ],
        ));
        idx++;
      }
      final str = content.toXmlString();
      write(file.$1, str.codeUnits);
    }

    // Update slides

    // Remove media
    removeAll(filter((file) => file.contains('ppt/media/'))
        .map((file) => file.$1)
        .toList());

    // Remove with path ppt/slides/
    removeAll(filter((file) => file.contains('ppt/slides/'))
        .map((file) => file.$1)
        .toList());

    // Add slides xml
    var idx = 1;
    var imgIdx = 0;
    {
      // Add fallback image
      write('ppt/media/media$imgIdx.bin', fallbackImage!);
      imgIdx++;
    }
    for (final item in items) {
      var imgId = 0;
      {
        final file = 'ppt/slides/slide$idx.xml';
        final content = XmlDocument.parse(slideBase!.xml);
        {
          final textNodes = content.findAllElements('a:t');
          // Find <a:t>Blank Message</a:t>
          final node =
              textNodes.firstWhere((e) => e.innerText == 'Blank Message');
          if (item.invertText) {
            final fill = XmlElement.tag(
              'a:solidFill',
              children: [
                XmlElement.tag(
                  'a:schemeClr',
                  attributes: [
                    XmlAttribute(XmlName('val'), 'bg1'),
                  ],
                ),
              ],
            );
            node.parent!.findElements('a:rPr').first.children.add(fill);
          }
          node.innerText = item.text ?? '';
        }
        // Find p:blipFill
        final blipFill = content.findAllElements('p:blipFill').first;
        // Find a:blip
        final blip = blipFill.findAllElements('a:blip').first;
        // Set image
        blip.attributes.clear();
        if (item.background != null) {
          blip.attributes
              .add(XmlAttribute(XmlName('r:embed'), idFromInt(imgIdx)));
          imgId = imgIdx;
          write('ppt/media/media$imgIdx.bin', item.background!);
          imgIdx++;
        } else {
          blip.attributes.add(XmlAttribute(XmlName('r:embed'), idFromInt(0)));
        }

        {
          final textNodes = content.findAllElements('a:t');
          // Find <a:t>Slide Title</a:t>
          final node =
              textNodes.firstWhere((e) => e.innerText == 'Slide Title');
          node.innerText = item.name;
        }

        {
          final textNodes = content.findAllElements('a:t');
          // Find <a:t>Text Value</a:t>
          final node = textNodes.firstWhere((e) => e.innerText == 'Text Value');
          node.innerText = item.footer ?? '';
        }

        final str = content.toXmlString();
        write(file, str.codeUnits);
      }
      {
        final file = 'ppt/slides/_rels/slide$idx.xml.rels';
        final content = XmlDocument.parse(slideBase!.xmlRels);
        final rels = content.findAllElements('Relationship');

        {
          // Set image
          final img =
              rels.firstWhere((e) => e.getAttribute('Type') == imageType);
          img.setAttribute('Id', idFromInt(imgId));
          img.setAttribute('Target', '/ppt/media/media$imgId.bin');
        }
        {
          // Set random id for slide layout
          final layout =
              rels.firstWhere((e) => e.getAttribute('Type') == layoutType);
          layout.setAttribute('Id', idFromInt(idx, 'l'));
        }
        if (notesSlideBase != null) {
          // Set notes
          final notes =
              rels.firstWhere((e) => e.getAttribute('Type') == notesType);
          notes.setAttribute('Id', idFromInt(idx, 'n'));
          notes.setAttribute('Target', '/ppt/notesSlides/notesSlide$idx.xml');
        }

        final str = content.toXmlString();
        write(file, str.codeUnits);
      }
      if (notesSlideBase != null) {
        final file = 'ppt/notesSlides/notesSlide$idx.xml';
        final content = XmlDocument.parse(notesSlideBase!.xml);

        if (item.notes != null) {
          // find p:spTree
          final spTree = content.findAllElements('p:spTree').first;
          final notes = XmlDocument.parse(createNotes(item.notes!))
              .findAllElements('p:sp')
              .first;
          spTree.children.add(notes.copy());
        }

        final str = content.toXmlString();
        write(file, str.codeUnits);
      }
      if (notesSlideBase != null) {
        final file = 'ppt/notesSlides/_rels/notesSlide$idx.xml.rels';
        final content = XmlDocument.parse(notesSlideBase!.xmlRels);

        final relationships = content.findAllElements('Relationships').first;
        final slide = relationships
            .findAllElements('Relationship')
            .where((e) => e.getAttribute('Type') == slideType)
            .first;
        slide.setAttribute('Id', idFromInt(idx));
        slide.setAttribute('Target', '/ppt/slides/slide$idx.xml');

        // Set random id for slide layout
        final layout = relationships
            .findAllElements('Relationship')
            .where((e) => e.getAttribute('Type') == notesLayoutType)
            .first;
        layout.setAttribute('Id', idFromInt(idx, 'nl'));

        final str = content.toXmlString();
        write(file, str.codeUnits);
      }

      idx++;
    }

    {
      // Update [Content_Types].xml
      final file = find((e) => e.endsWith('[Content_Types].xml'));
      final bytes = file!.$2;
      final raw = String.fromCharCodes(bytes);
      final content = XmlDocument.parse(raw);
      final overrides = content.findAllElements('Override');

      // Remove existing notes and slides
      overrides
          .where(
              (e) => e.getAttribute('PartName')!.contains('ppt/notesSlides/'))
          .forEach((e) => e.remove());
      overrides
          .where((e) => e.getAttribute('PartName')!.contains('ppt/slides/'))
          .forEach((e) => e.remove());

      final types = content.findAllElements('Types').first;

      // Add new notes and slides
      var idx = 1;
      for (final _ in items) {
        types.children.add(XmlElement(
          XmlName('Override'),
          [
            XmlAttribute(
                XmlName('PartName'), '/ppt/notesSlides/notesSlide$idx.xml'),
            XmlAttribute(XmlName('ContentType'),
                "application/vnd.openxmlformats-officedocument.presentationml.notesSlide+xml"),
          ],
        ));
        types.children.add(XmlElement(
          XmlName('Override'),
          [
            XmlAttribute(XmlName('PartName'), '/ppt/slides/slide$idx.xml'),
            XmlAttribute(XmlName('ContentType'),
                "application/vnd.openxmlformats-officedocument.presentationml.slide+xml"),
          ],
        ));
        idx++;
      }

      final str = content.toXmlString();
      write(file.$1, str.codeUnits);
    }
  }

  String createFooter(String text) {
    return '''
    <p:sp>
        <p:nvSpPr>
            <p:cNvPr id="3" name="HymnText" />
            <p:cNvSpPr txBox="1" />
            <p:nvPr />
        </p:nvSpPr>
        <p:spPr>
            <a:xfrm>
                <a:off x="152400" y="4800600" />
                <a:ext cx="8839200" cy="369332" />
            </a:xfrm>
            <a:prstGeom prst="rect">
                <a:avLst />
            </a:prstGeom>
            <a:noFill />
        </p:spPr>
        <p:txBody>
            <a:bodyPr wrap="square" rtlCol="0">
                <a:spAutoFit />
            </a:bodyPr>
            <a:lstStyle />
            <a:p>
                <a:pPr algn="r" />
                <a:r>
                    <a:rPr lang="en-US" dirty="0" />
                    <a:t>$text</a:t>
                </a:r>
            </a:p>
        </p:txBody>
    </p:sp>
    ''';
  }

  String createNotes(String text) {
    return '''
    <p:sp>
        <p:nvSpPr>
            <p:cNvPr id="24" name="Shape 24" />
            <p:cNvSpPr />
            <p:nvPr>
                <p:ph type="body" sz="quarter" idx="1" />
            </p:nvPr>
        </p:nvSpPr>
        <p:spPr>
            <a:prstGeom prst="rect">
                <a:avLst />
            </a:prstGeom>
        </p:spPr>
        <p:txBody>
            <a:bodyPr />
            <a:lstStyle />
            <a:p>
                <a:pPr />
                <a:r>
                    <a:t>$text</a:t>
                </a:r>
            </a:p>
        </p:txBody>
    </p:sp>
    ''';
  }

  String createTitle(String text) {
    return '''
    <p:sp>
        <p:nvSpPr>
            <p:cNvPr id="4" name="Title 3" />
            <p:cNvSpPr>
                <a:spLocks noGrp="1" />
            </p:cNvSpPr>
            <p:nvPr>
                <p:ph type="title" idx="4294967295" />
            </p:nvPr>
        </p:nvSpPr>
        <p:spPr />
        <p:txBody>
            <a:bodyPr />
            <a:lstStyle />
            <a:p>
                <a:r>
                    <a:rPr lang="en-US" dirty="0" />
                    <a:t>$text</a:t>
                </a:r>
            </a:p>
        </p:txBody>
    </p:sp>
    ''';
  }

  String idFromInt(int val, [String suffix = '']) {
    final key = (val, suffix);
    if (ids.containsKey(key)) return ids[key]!;
    final newId = shortid.generate();
    ids[key] = 'R$newId$suffix';
    return ids[key]!;
  }
}
