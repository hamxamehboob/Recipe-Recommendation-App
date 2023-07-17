import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF6CC51D);
}

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
        color: AppColors.primary,
        fontWeight: FontWeight.w700,
        fontSize: 20,
        letterSpacing: 3,
      ),
      bodySmall: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.w600,
      ),
      bodyMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: Color(0xFF8F8F9E),
        fontSize: 15,
        fontFamily: 'Poppins',
      ),
    ),
  );
}
