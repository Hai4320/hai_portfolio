import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

class AppTheme {
  AppTheme._({required this.context});

  final BuildContext context;

  factory AppTheme.of(BuildContext context) {
    return AppTheme._(context: context);
  }

  ThemeData get darkTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          background: AppColors.black1,
          error: Colors.red,
          onTertiary: Colors.orange,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.black1,
        textTheme:
            GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: AppColors.lightPeriwinkle,
        ).copyWith(

        ),
      );

  ThemeData get lightTheme => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          background: AppColors.white,
          error: Colors.red,
          onTertiary: Colors.orange,
        ),
        scaffoldBackgroundColor: AppColors.black1,
        useMaterial3: true,
        textTheme:
            GoogleFonts.openSansTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.black,
        ),
      );
}
