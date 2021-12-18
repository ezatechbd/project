import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light();

ThemeData darkTheme = ThemeData.dark();

ThemeData pinkTheme = lightTheme.copyWith(
  primaryColor: Colors.pink[100],
  scaffoldBackgroundColor: const Color(0xFFF49FB6),
  cardColor: Colors.green,
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Colors.green,
    backgroundColor: Colors.yellow,
  ),
  textTheme: const TextTheme(
    // bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: Colors.white,
    // displayColor: Colors.blue,
  ),
);

ThemeData halloweenTheme = lightTheme.copyWith(
  primaryColor: const Color(0xFF55705A),
  scaffoldBackgroundColor: const Color(0xFFE48873),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    foregroundColor: Color(0xFFea8e71),
    backgroundColor: Color(0xFF2b2119),
  ),
  textTheme: const TextTheme(
    // bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: Colors.black,
    // displayColor: Colors.blue,
  ),
);

ThemeData darkBlueTheme = lightTheme.copyWith(
  primaryColor: const Color(0xFF1E1E2C),
  scaffoldBackgroundColor: const Color(0xFF2D2D44),
  textTheme: const TextTheme(
    // bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: Colors.yellow,
    // displayColor: Colors.blue,
  ),
);

ThemeData redTheme = lightTheme.copyWith(
  primaryColor: Colors.red,
  textTheme: const TextTheme(
    // bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: Colors.red,
    // displayColor: Colors.blue,
  ),
);

ThemeData purpleTheme = lightTheme.copyWith(
  primaryColor: Colors.purple[900],
  cardColor: Colors.yellowAccent,
  textTheme: const TextTheme(
    // bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: Colors.purple[900],
    // displayColor: Colors.blue,
  ),
);

ThemeData tealTheme = lightTheme.copyWith(
  primaryColor: Colors.teal,
  scaffoldBackgroundColor: Colors.teal,
  textTheme: const TextTheme(
    // bodyText1: TextStyle(),
    bodyText2: TextStyle(),
  ).apply(
    bodyColor: Colors.yellow[900],
    // displayColor: Colors.blue,
  ),
);
