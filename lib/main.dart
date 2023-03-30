import 'package:flutter/material.dart';

import 'package:band_names/screens/screens.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Band Names',
      routes: {
        'home':(context) =>const HomeScreen(),
      },
      initialRoute: 'home',
    );
  }
}