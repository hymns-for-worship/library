import 'package:fluent_ui/fluent_ui.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:signals/signals_flutter.dart';
import 'package:zoomable_photo_gallery/zoomable_photo_gallery.dart';

import '../../../instance.dart';

class HymnDetails extends StatefulWidget {
  const HymnDetails({super.key, required this.hymnId});

  final String hymnId;

  @override
  State<HymnDetails> createState() => _HymnDetailsState();
}

class _HymnDetailsState extends State<HymnDetails> {
  final getHymn = GetHymn($.get<HfwDatabase>());
  late final get = getHymn(widget.hymnId).toSignal();

  @override
  Widget build(BuildContext context) {
    final state = get.watch(context);
    if (state.hasValue) {
      final hymn = state.requireValue.hymn;
      if (hymn == null) {
        return const ScaffoldPage(
          header: PageHeader(
            title: Text('Hymn Details'),
          ),
          content: Center(child: Text('Hymn not found')),
        );
      }
      return ScaffoldPage(
        header: PageHeader(
          title: Watch((context) {
            final hymn = get.value.value?.hymn;
            if (hymn != null) {
              return Text(hymn.title);
            }
            return const Text('Hymn Details');
          }),
          // commandBar: CommandBar(
          //   primaryItems: [
          //     CommandBarButton(
          //       icon: const Icon(FluentIcons.archive),
          //       label: const Text('Archive'),
          //       onPressed: () {},
          //     ),
          //     CommandBarButton(
          //       icon: const Icon(FluentIcons.move),
          //       label: const Text('Move'),
          //       onPressed: () {},
          //     ),

          //     // HymnDownloadButton(hymnId: widget.hymn.id),
          //   ],
          // ),
        ),
        content: Builder(
          builder: (context) {
            final music = state.value?.archive?.getMusic();
            // final title = value.archive?.getTitle();
            final images = [
              // if (title != null) title,
              if (music != null) ...music,
            ];
            if (images.isEmpty) {
              return const Center(child: Text('Hymn not downloaded'));
            }
            return ZoomablePhotoGallery(
              backColor: FluentTheme.of(context).scaffoldBackgroundColor,
              imageList: List.generate(
                images.length,
                (index) => Image.memory(images[index].data),
              ),
            );
          },
        ),
      );
    }
    return const ScaffoldPage(
      header: PageHeader(
        title: Text('Hymn Details'),
      ),
      content: Center(child: ProgressRing()),
    );
  }
}

// class MaybeHymnDetails extends StatefulWidget {
//   const MaybeHymnDetails({super.key, required this.hymnId});

//   final String hymnId;

//   @override
//   State<MaybeHymnDetails> createState() => _MaybeHymnDetailsState();
// }

// class _MaybeHymnDetailsState extends State<MaybeHymnDetails> {
//   late final getHymn = GetHymn($.get<HfwDatabase>());
//   late final result = getHymn(widget.hymnId).toSignal();

//   @override
//   Widget build(BuildContext context) {
//     return Watch(
//       (context) => result.value.map(
//         loading: () => const ScaffoldPage(
//           header: PageHeader(title: Text('Hymn Details')),
//           content: Center(child: ProgressRing()),
//         ),
//         error: (error, stackTrace) => ScaffoldPage(
//           header: const PageHeader(title: Text('Hymn Details')),
//           content: Center(
//             child: Text(
//               'Error loading hymns: $error\n$stackTrace',
//             ),
//           ),
//         ),
//         data: (results) {
//           if (results.hymn == null) {
//             return const ScaffoldPage(
//               header: PageHeader(title: Text('Hymn Details')),
//               content: Center(child: Text('Hymn not found')),
//             );
//           }
//           return HymnDetails(hymn: results.hymn!);
//         },
//       ),
//     );
//   }
// }
