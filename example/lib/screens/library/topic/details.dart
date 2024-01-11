import 'package:flutter/material.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:signals/signals_flutter.dart';

import '../../../instance.dart';
import '../hymn/details.dart';

class TopicDetails extends StatefulWidget {
  const TopicDetails({super.key, required this.topic});

  final Topic topic;

  @override
  State<TopicDetails> createState() => _TopicDetailsState();
}

class _TopicDetailsState extends State<TopicDetails> {
  late final get = GetTopic($.get<HfwDatabase>())(widget.topic.id).toSignal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.topic.name),
      ),
      body: Watch((context) {
        return get.value.maybeMap(
          data: (value) {
            if (value.topic == null) {
              return const ListTile(
                title: Text('Topic not found'),
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
