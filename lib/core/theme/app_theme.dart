import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primary = Color(0xFF1A73E8);
  static const Color error = Color(0xFFEA4335);
  static const Color textPrimary = Color(0xFF202124);
  static const Color textSecondary = Color(0xFF5F6368);
  static const Color divider = Color(0xFFE8EAED);
  static const Color surfaceColor = Color(0xFFF8F9FA);


  static ThemeData get light => ThemeData(
    useMaterial3: true,
    colorSchemeSeed: primary,
    scaffoldBackgroundColor: const Color(0xFFF8F9FA),
  );
}