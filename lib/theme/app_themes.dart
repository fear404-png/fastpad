import 'package:flutter/material.dart';

final List<ThemeData> appThemeData = [
  ThemeData(
    colorScheme: const ColorScheme.dark().copyWith(
      secondary: Colors.redAccent,
      primary: Colors.red,
      onError: Colors.white,
    ),
  ),
  ThemeData(
    colorScheme: const ColorScheme.dark().copyWith(
        secondary: Colors.green,
        primary: Colors.green,
        onBackground: Colors.black,
        surface: Colors.black,
        onSurface: Colors.green,
        background: Colors.black,
        onError: Colors.white,
        brightness: Brightness.dark),
  ),
  ThemeData(
    colorScheme: const ColorScheme.light().copyWith(
        primary: Colors.redAccent,
        secondary: Colors.redAccent,
        onError: Colors.black),
  ),
  ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.red)
          .copyWith(onError: Colors.black)),
  ThemeData(
      colorScheme:
          const ColorScheme.highContrastDark().copyWith(onError: Colors.white))
];

final List<String> appThemeName = [
  "Темная Стандарт",
  "Терминал",
  "Стандарт",
  "Агрессия ",
  "Спокойствие"
];
