import 'package:flutter/material.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:signals/signals_flutter.dart';

import '../../../instance.dart';
import 'details.dart';

class HymnalsScreen extends StatefulWidget {
  const HymnalsScreen({super.key});

  @override
  State<HymnalsScreen> createState() => _HymnalsScreenState();
}

class _HymnalsScreenState extends State<HymnalsScreen> {
  final items = GetHymnals($.get<HfwDatabase>())().toSignal();

  @override
  void dispose() {
    items.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Hymnals')),
      body: Watch(
        (context) => items.value.map(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Text(
            'Error loading hymnals: $error\n$stackTrace',
          ),
          data: (results) {
            if (results.isEmpty) {
              return const Center(child: Text('No hymnals found'));
            }
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final result = results[index];
                return ListTile(
                  title: Text(result.name),
                  subtitle: Text(result.alias),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => HymnalDetails(hymnal: result),
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
