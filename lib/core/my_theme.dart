import 'package:flutter/material.dart';

abstract class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      primary: const Color.fromARGB(255, 54, 243, 33),
      secondary: const Color.fromARGB(255, 5, 150, 0),
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 14.0),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      primary: const Color.fromARGB(255, 54, 243, 33),
      secondary: const Color.fromARGB(255, 5, 150, 0),
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: const Color.fromARGB(200, 255, 255, 255),
      ),
    ),
  );
}
