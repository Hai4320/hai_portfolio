import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._({required this.context});

  final BuildContext context;

  factory AppTheme.of(BuildContext context) {
    return AppTheme._(context: context);
  }

  ThemeData get darkTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          background: Colors.white,
          error: Colors.red,
          onTertiary: Colors.orange,
        ),
        useMaterial3: true,
        textTheme:
            GoogleFonts.openSansTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.white,
        ),
      );

  ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          background: Colors.black38,
          error: Colors.red,
          onTertiary: Colors.orange,
        ),
        useMaterial3: true,
        textTheme:
            GoogleFonts.openSansTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.white,
        ),
      );
}
