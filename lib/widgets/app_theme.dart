import 'package:flutter/material.dart';

class AppThemes {
  // Светлая тема
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.green,
    scaffoldBackgroundColor: Colors.white,
    // Настройка AppBar для всей программы сразу
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
    ),
    // Настройка карточек
    cardColor: Colors.grey[100],
  );

  // Темная тема (как на твоем скриншоте)
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.greenAccent,
    scaffoldBackgroundColor: const Color(0xFF1A1A2E), // Тот самый темный фон
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF16213E),
      foregroundColor: Colors.white,
    ),
    cardColor: const Color(0xFF0F3460),
  );
}