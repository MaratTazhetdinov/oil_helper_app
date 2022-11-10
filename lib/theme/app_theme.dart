import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData define() {
    return ThemeData(
      splashColor: Colors.transparent,
      splashFactory: NoSplash.splashFactory,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: const Color(0xFFEDE9E8),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFFED1B34),
        selectedItemColor: Color(0xFFED1B34),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Color(0xFFED1B34),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: 22,
        ),
      ),
      textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
          ),
          bodyMedium: TextStyle(fontWeight: FontWeight.w200, fontSize: 16)),
      fontFamily: 'Open Sans Font',
    );
  }
}
