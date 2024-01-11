import 'dart:math';

import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:signals/signals_flutter.dart';

import 'library/hymn/list.dart';
import 'library/hymnal/list.dart';
import 'library/stakeholder/list.dart';
import 'library/topic/list.dart';
// import 'package:url_launcher/link.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.child});

  final Widget? child;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _index = signal(0);
  final searchFocus = FocusNode();

  int currentIndex = 0;
  List<Tab> tabs = [];

  /// Creates a tab for the given index
  Tab generateTab(int index) {
    late Tab tab;
    tab = Tab(
      text: Text('Document $index'),
      semanticLabel: 'Document #$index',
      icon: const FlutterLogo(),
      body: Container(
        color:
            Colors.accentColors[Random().nextInt(Colors.accentColors.length)],
      ),
      onClosed: () {
        setState(() {
          tabs!.remove(tab);

          if (currentIndex > 0) currentIndex--;
        });
      },
    );
    return tab;
  }

  @override
  Widget build(BuildContext context) {
    final index = _index.watch(context);
    return NavigationView(
      appBar: NavigationAppBar(
        automaticallyImplyLeading: false,
        leading: Builder(builder: (context) {
          if (context.canPop()) {
            return IconButton(
              icon: const Icon(FluentIcons.chevron_left),
              onPressed: context.pop,
            );
          } else {
            return const SizedBox.shrink();
          }
        }),
        title: const Text(
          'Hymns for Worship',
          style: TextStyle(fontSize: 16),
        ),
        // actions: Row(
        //   mainAxisSize: MainAxisSize.min,
        //   mainAxisAlignment: MainAxisAlignment.end,
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     IconButton(
        //       icon: const Icon(FluentIcons.account_management, size: 20),
        //       onPressed: () {},
        //     ),
        //   ],
        // ),
      ),
      onOpenSearch: searchFocus.requestFocus,
      pane: NavigationPane(
        selected: index,
        onChanged: _index.set,
        autoSuggestBoxReplacement: const Icon(FluentIcons.search),
        // header: Padding(
        //   padding: const EdgeInsets.only(bottom: 4.0),
        //   child: Text("Header",
        //       style: FluentTheme.of(context)
        //           .typography
        //           .bodyLarge!
        //           .copyWith(fontWeight: FontWeight.bold)),
        // ),
        autoSuggestBox: AutoSuggestBox(
          focusNode: searchFocus,
          unfocusedColor: Colors.transparent,
          items: const [],
          trailingIcon: IgnorePointer(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(FluentIcons.search),
            ),
          ),
          placeholder: 'Search',
        ),
        items: [
          // PaneItem(
          //   key: const ValueKey('/'),
          //   icon: const Icon(FluentIcons.home),
          //   title: const Text('Home'),
          //   body: const SizedBox.shrink(),
          // ).route(context),
          PaneItemHeader(header: const Text('Library')),
          PaneItem(
            key: const ValueKey('/library/hymns'),
            icon: const Icon(FluentIcons.music_note),
            title: const Text('Hymns'),
            body: const HymnsScreen(),
          ).route(context),
          PaneItem(
            key: const ValueKey('/library/hymnals'),
            icon: const Icon(FluentIcons.book_answers),
            title: const Text('Hymnals'),
            body: const HymnalsScreen(),
          ).route(context),
          PaneItem(
            key: const ValueKey('/library/topics'),
            icon: const Icon(FluentIcons.tag),
            title: const Text('Topics'),
            body: const TopicsScreen(),
          ).route(context),
          PaneItem(
            key: const ValueKey('/library/stakeholders'),
            icon: const Icon(FluentIcons.people),
            title: const Text('Stakeholders'),
            body: const StakeholdersScreen(),
          ).route(context),
          PaneItem(
            key: const ValueKey('/library/downloads'),
            icon: const Icon(FluentIcons.download),
            title: const Text('Downloads'),
            body: const SizedBox.shrink(),
          ),
          PaneItemHeader(header: const Text('Account')),
          PaneItem(
            icon: const Icon(FluentIcons.music_note),
            title: const Text('Saved Hymns'),
            body: const Placeholder(),
          ).route(context),
          PaneItem(
            icon: const Icon(FluentIcons.tag),
            title: const Text('Saved Topics'),
            body: const Placeholder(),
          ).route(context),
          PaneItem(
            key: const ValueKey('/profile/playlists'),
            icon: const Icon(FluentIcons.playlist_music),
            title: const Text('Playlists'),
            body: const Placeholder(),
          ).route(context),
        ],
        footerItems: [
          PaneItem(
            key: const ValueKey('/profile'),
            icon: const Icon(FluentIcons.account_management),
            title: const Text('Profile'),
            body: const Placeholder(),
          ).route(context),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Settings'),
            body: const Placeholder(),
          ),
        ],
      ),
      paneBodyBuilder: (pane, child) {
        return widget.child ?? const SizedBox.shrink();
      },
      // content: TabView(
      //   tabs: tabs,
      //   currentIndex: currentIndex,
      //   onChanged: (index) => setState(() => currentIndex = index),
      //   tabWidthBehavior: TabWidthBehavior.sizeToContent,
      //   closeButtonVisibility: CloseButtonVisibilityMode.always,
      //   showScrollButtons: true,
      //   // wheelScroll: false,
      //   onNewPressed: () {
      //     setState(() {
      //       final index = tabs!.length + 1;
      //       final tab = generateTab(index);
      //       tabs!.add(tab);
      //     });
      //   },
      //   onReorder: (oldIndex, newIndex) {
      //     setState(() {
      //       if (oldIndex < newIndex) {
      //         newIndex -= 1;
      //       }
      //       final item = tabs.removeAt(oldIndex);
      //       tabs.insert(newIndex, item);

      //       if (currentIndex == newIndex) {
      //         currentIndex = oldIndex;
      //       } else if (currentIndex == oldIndex) {
      //         currentIndex = newIndex;
      //       }
      //     });
      //   },
      // ),
    );
  }
}

extension on PaneItem {
  PaneItem route(BuildContext context) {
    return PaneItem(
      key: key,
      icon: icon,
      title: title,
      body: const SizedBox.shrink(),
      onTap: () {
        final path = (key as ValueKey).value;
        if (GoRouterState.of(context).uri.toString() != path) {
          context.push(path);
        }
        onTap?.call();
        (context as Element).markNeedsBuild();
      },
    );
  }
}
