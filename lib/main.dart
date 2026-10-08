import 'package:flutter/material.dart';
import 'package:movies_list/HomePage.dart';
import 'package:provider/provider.dart';

import 'SeriesProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => SeriesProvider()..fetchSeries(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies List',
      theme: ThemeData(useMaterial3: true),
      home: const Scaffold(
        body: HomePage(),
      ),
    );
  }
}