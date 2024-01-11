import 'package:flutter/material.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:signals/signals_flutter.dart';

import '../../../instance.dart';
import '../hymn/details.dart';

class HymnalDetails extends StatefulWidget {
  const HymnalDetails({super.key, required this.hymnal});

  final Hymnal hymnal;

  @override
  State<HymnalDetails> createState() => _HymnalDetailsState();
}

class _HymnalDetailsState extends State<HymnalDetails> {
  late final get = GetHymnal($.get<HfwDatabase>())(widget.hymnal.id).toSignal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.hymnal.name),
      ),
      body: Watch((context) {
        return get.value.maybeMap(
          data: (value) {
            if (value.hymnal == null) {
              return const ListTile(
                title: Text('Hymnal not found'),
              );
            }
            return ListView.builder(
              itemCount: value.hymns.length,
              itemBuilder: (context, index) {
                final hymn = value.hymns[index];
                return ListTile(
                  title: Text(hymn.title),
                  subtitle: Text(hymn.number),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HymnDetails(hymnId: hymn.id),
                    ),
                  ),
                );
              },
            );
          },
          orElse: () => const CircularProgressIndicator(),
        );
      }),
    );
  }
}
