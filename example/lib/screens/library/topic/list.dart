import 'package:flutter/material.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:signals/signals_flutter.dart';

import '../../../instance.dart';
import 'details.dart';

class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  final items = GetTopics($.get<HfwDatabase>())().toSignal();

  @override
  void dispose() {
    items.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Topics')),
      body: Watch(
        (context) => items.value.map(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Text(
            'Error loading topics: $error\n$stackTrace',
          ),
          data: (results) {
            if (results.isEmpty) {
              return const Center(child: Text('No topics found'));
            }
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final result = results[index];
                return ListTile(
                  title: Text(result.name),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => TopicDetails(topic: result),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
