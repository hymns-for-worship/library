import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../bundles.dart';
import 'hymnal/list.dart';
import 'hymn/list.dart';
import 'stakeholder/list.dart';
import 'topic/list.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Library'),
        actions: [
          IconButton(
            tooltip: 'Show bundles',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const BundlesScreen(),
              ),
            ),
            icon: const Icon(Icons.download),
          ),
          IconButton(
            tooltip: 'Go to profile',
            onPressed: () => context.push('/profile'),
            icon: const Icon(Icons.account_circle),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Topics'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const TopicsScreen(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Hymnals'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HymnalsScreen(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Stakeholders'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const StakeholdersScreen(),
              ),
            ),
          ),
          ListTile(
            title: const Text('Hymns'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const HymnsScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
