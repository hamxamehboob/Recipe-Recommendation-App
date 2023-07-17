import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        color: Colors.black,
        fontSize: 30,
        letterSpacing: 0.03,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        color: Color.fromARGB(255, 75, 75, 75),
        fontWeight: FontWeight.bold,
        fontSize: 18,
        letterSpacing: 1,
      ),
      titleMedium: TextStyle(
        color: Color.fromARGB(255, 0, 0, 0),
        fontSize: 15,
        letterSpacing: 3,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: TextStyle(
        color: Color(0xFF6CC51D),
        fontWeight: FontWeight.w700,
        fontSize: 20,
        letterSpacing: 3,
      ),
    ),
  );
}
