import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'instance.dart';

class HfwCoreApp extends StatelessWidget {
  const HfwCoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    final router = $.get<GoRouter>();
    return FluentApp.router(
      debugShowCheckedModeBanner: false,
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      theme: FluentThemeData.light(),
      darkTheme: FluentThemeData.dark(),
    );
  }
}
