import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    highlightColor: Colors.black,
    secondaryHeaderColor: Colors.orange.shade500,
    primaryColor: Colors.orange,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      color: Colors.orange,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.orange,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.orange,
    ),
    iconTheme: const IconThemeData(
      color: Colors.orange,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    
    brightness: Brightness.dark,
    primaryColor: Colors.orange,
    
     highlightColor: Colors.white,
    secondaryHeaderColor: Colors.orange.shade500,
    scaffoldBackgroundColor: const Color(0xFF121212),
    appBarTheme: const AppBarTheme(
      color: Color(0xFF1F1F1F),
      iconTheme: IconThemeData(color: Colors.white),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.orange,
      textTheme: ButtonTextTheme.primary,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.orange,
    ),
    iconTheme: const IconThemeData(
      color: Colors.orange,
    ),

  );
}
