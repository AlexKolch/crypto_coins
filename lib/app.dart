import 'package:flutter/material.dart';
import 'Router/router.dart';
import 'Theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crypto coins',
      theme: mainTheme,
      routes: routes,
    );
  }
}