import 'package:flutter/material.dart';

final List<ThemeData> appThemeData = [
  ThemeData(
    colorScheme: const ColorScheme.dark().copyWith(
      secondary: Colors.redAccent,
      primary: Colors.redAccent,
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
      onError: Colors.green,
      inverseSurface: Colors.green,
      inversePrimary: Colors.black,
    ),
  ),
  ThemeData(
    colorScheme: const ColorScheme.light(
        primary: Colors.black,
        secondary: Colors.white,
        surface: Colors.white,
        inversePrimary: Colors.white,
        onBackground: Colors.white,
        onError: Colors.white,
        inverseSurface: Colors.black),
  ),
  ThemeData(
      colorScheme:
          ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 102, 86, 36))
              .copyWith(onError: Colors.black)),
  ThemeData(
      colorScheme: const ColorScheme.dark(
          inversePrimary: Colors.black,
          primary: Colors.amberAccent,
          inverseSurface: Colors.pinkAccent,
          secondary: Colors.lightBlueAccent))
];

final List<String> appThemeName = [
  "Стандарт",
  "Терминал",
  "Траур",
  "Защита зрения",
  "Киберпанк"
];
