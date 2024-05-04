import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.blue,
    background: Colors.white,
    error: Colors.red,
    onTertiary: Colors.orange,
  ),
  useMaterial3: true,
);

ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.purple,
    background: Colors.black38,
    error: Colors.red,
    onTertiary: Colors.orange,
  ),
  useMaterial3: true,
);
