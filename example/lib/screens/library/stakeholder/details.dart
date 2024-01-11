import 'package:flutter/material.dart';
import 'package:hfw_core/hfw_core.dart';
import 'package:signals/signals_flutter.dart';

import '../../../instance.dart';
import '../hymn/details.dart';

class StakeholderDetails extends StatefulWidget {
  const StakeholderDetails({super.key, required this.stakeholder});

  final Stakeholder stakeholder;

  @override
  State<StakeholderDetails> createState() => _StakeholderDetailsState();
}

class _StakeholderDetailsState extends State<StakeholderDetails> {
  late final get =
      GetStakeholder($.get<HfwDatabase>())(widget.stakeholder.id).toSignal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.stakeholder.name),
      ),
      body: Watch((context) {
        return get.value.maybeMap(
          data: (value) {
            if (value.stakeholder == null) {
              return const ListTile(
                title: Text('Stakeholder not found'),
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
