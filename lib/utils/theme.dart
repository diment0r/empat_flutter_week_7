import 'package:flutter/material.dart';

abstract class ThemeDesignData {
  static final lightTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.red,
      brightness: Brightness.light,
    ),
  );

  static final darkTheme = ThemeData(
    useMaterial3: true,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: const Color.fromARGB(255, 14, 14, 14),
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.yellow,
      brightness: Brightness.dark,
    ),
  );

  static const baseShimmerColor = Color.fromARGB(255, 222, 222, 222);
  static const highlightShimmerColor = Color.fromARGB(168, 207, 207, 207);
}
