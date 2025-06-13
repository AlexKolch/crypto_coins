import 'package:flutter/material.dart';
import 'Router/router.dart';
import 'Theme/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Crypto coins',
      theme: mainTheme,
      routerConfig: _appRouter.config(),
      // routes: routes,
    );
  }
}