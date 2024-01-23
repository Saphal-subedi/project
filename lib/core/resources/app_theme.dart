import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appThemeData = ThemeData(
    primaryColor: Colors.blue.shade300,
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      elevation: 2.0,
      backgroundColor: Colors.blue,
    ),
    useMaterial3: true,
    iconTheme: const IconThemeData(
      color: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: Colors.grey,
      filled: true,
      fillColor: Colors.grey.shade200,
      contentPadding: const EdgeInsets.all(12),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.red),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(5),
      ),
      focusColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(color: Colors.green),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
