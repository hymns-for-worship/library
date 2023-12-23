import 'package:flutter/material.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:signals/signals_flutter.dart';

import '../../../instance.dart';
import '../../../widgets/hymn_download.dart';

class HymnDetails extends StatefulWidget {
  const HymnDetails({super.key, required this.hymn});

  final Hymn hymn;

  @override
  State<HymnDetails> createState() => _HymnDetailsState();
}

class _HymnDetailsState extends State<HymnDetails> {
  final getHymn = GetHymn(
    db: $.get<HfwDatabase>(),
    getHymnArchive: $.get<GetHymnArchive>(),
  );
  late final get = getHymn(widget.hymn.id).toSignal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hymn.title),
        actions: [
          HymnDownloadButton(hymnId: widget.hymn.id),
        ],
      ),
      body: Watch((context) {
        return get.value.maybeMap(
          data: (value) {
            if (value.hymn == null) {
              return const Center(
                child: Text('Hymn not found'),
              );
            }
            final title = value.archive?.getTitle();
            final music = value.archive?.getMusic();
            return ListView(
              children: [
                if (title != null) ...[
                  const ListTile(title: Text('Title')),
                  ListTile(
                    title: Text(title.path),
                    subtitle: Image.memory(title.data),
                  ),
                ],
                if (music != null) ...[
                  const ListTile(title: Text('Music')),
                  for (final item in music)
                    ListTile(
                      title: Text(item.path),
                      subtitle: Image.memory(item.data),
                    ),
                ],
              ],
            );
          },
          orElse: () => const CircularProgressIndicator(),
        );
      }),
    );
  }
}
