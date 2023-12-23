import 'package:flutter/material.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:signals/signals_flutter.dart';

import '../../../instance.dart';
import 'details.dart';

class StakeholdersScreen extends StatefulWidget {
  const StakeholdersScreen({super.key});

  @override
  State<StakeholdersScreen> createState() => _StakeholdersScreenState();
}

class _StakeholdersScreenState extends State<StakeholdersScreen> {
  final items = GetStakeholders($.get<HfwDatabase>())().toSignal();

  @override
  void dispose() {
    items.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stakeholders')),
      body: Watch(
        (context) => items.value.map(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Text(
            'Error loading stakeholders: $error\n$stackTrace',
          ),
          data: (results) {
            if (results.isEmpty) {
              return const Center(child: Text('No stakeholders found'));
            }
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                final result = results[index];
                return ListTile(
                  title: Text(result.name),
                  onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          StakeholderDetails(stakeholder: result),
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
