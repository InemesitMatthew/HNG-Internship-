import 'package:flutter/material.dart';

// Defines the light theme for the app
ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300,
    primary: Colors.grey.shade500,
    secondary: Colors.grey.shade200,
    tertiary: Colors.grey.shade600,
    inversePrimary: Colors.grey.shade900,
  ),
);

// Defines the dark theme for the app
ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color.fromARGB(255, 20, 20, 20),
    primary: const Color.fromARGB(255, 122, 122, 122),
    secondary: const Color.fromARGB(255, 30, 30, 30),
    tertiary: Colors.grey.shade600,
    inversePrimary: Colors.grey.shade300,
  ),
);
