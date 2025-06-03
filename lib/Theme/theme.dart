import 'package:flutter/material.dart';

final mainTheme = ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 31, 31, 31),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        appBarTheme: const AppBarTheme(
          elevation: 0, //тень, подложка для бара
          backgroundColor: Color.fromARGB(255, 31, 31, 31),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        dividerColor: Colors.white24,
        listTileTheme: const ListTileThemeData(iconColor: Colors.white),
        textTheme: TextTheme(
          bodyMedium: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
          labelSmall: TextStyle(
            color: Colors.white.withValues(alpha: 0.6),
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
        ),
      );