import 'package:flutter/material.dart';

final List<ThemeData> appThemeData = [
  ThemeData(
    colorScheme: const ColorScheme.dark().copyWith(
      secondary: Colors.redAccent,
      primary: Colors.red,
    ),
  ),
  ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
      primary: Colors.redAccent,
      secondary: Colors.redAccent,
    ),
  ),
];

final List<String> appThemeName = ["Стандартная Темная", "Стандартная Светлая"];
