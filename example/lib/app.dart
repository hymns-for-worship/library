import 'package:flutter/material.dart';

import 'screens/library/details.dart';

class HfwCoreApp extends StatelessWidget {
  const HfwCoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const LibraryScreen(),
    );
  }
}
