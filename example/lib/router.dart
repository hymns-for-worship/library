import 'package:example/screens/library/hymn/details.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pocketbase_ui/pocketbase_ui.dart';

import 'instance.dart';
import 'screens/account/playlists.dart';
import 'screens/home.dart';
import 'screens/library/hymn/list.dart';
import 'screens/library/hymnal/list.dart';
import 'screens/library/stakeholder/list.dart';
import 'screens/library/topic/list.dart';

const loginUrl = '/login';
const redirectKey = 'redirect_url';

String? authGuard(BuildContext context, GoRouterState state) {
  final controller = $.get<AuthController>();
  if (!controller.isSignedIn) {
    return '$loginUrl?$redirectKey=${state.matchedLocation}';
  }
  return null;
}

GoRouter createRouter() {
  final controller = $.get<AuthController>();
  return GoRouter(
    initialLocation: '/',
    refreshListenable: controller,
    redirect: (context, state) {
      if (!controller.isSignedIn) return loginUrl;
      return null;
    },
    routes: <RouteBase>[
      ShellRoute(
        builder: (context, state, child) => Home(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const Placeholder(),
            routes: [
              GoRoute(
                path: 'library/hymns',
                builder: (context, state) => const HymnsScreen(),
                routes: [
                  GoRoute(
                    path: ':hymnId',
                    builder: (context, state) {
                      final hymnId = state.pathParameters['hymnId']!;
                      return HymnDetails(hymnId: hymnId);
                    },
                  ),
                ],
              ),
              GoRoute(
                path: 'library/hymnals',
                builder: (context, state) => const HymnalsScreen(),
              ),
              GoRoute(
                path: 'library/topics',
                builder: (context, state) => const TopicsScreen(),
              ),
              GoRoute(
                path: 'library/stakeholders',
                builder: (context, state) => const StakeholdersScreen(),
              ),
              GoRoute(
                path: 'profile',
                redirect: authGuard,
                builder: (context, state) =>
                    ProfileScreen(controller: controller),
                routes: [
                  GoRoute(
                    path: 'playlists',
                    builder: (context, state) => const PlaylistsScreen(),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: loginUrl,
        redirect: (context, state) {
          if (controller.isSignedIn) {
            final prev = state.uri.queryParameters[redirectKey];
            if (prev != null) return prev;
            return '/';
          }
          return null;
        },
        builder: (context, state) {
          return SignInScreen(
            controller: controller,
            background: const LoginBackground(),
            onLoginSuccess: () {},
          );
        },
      ),
    ],
  );
}

class LoginBackground extends StatelessWidget {
  const LoginBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
