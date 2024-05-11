import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hai_portfolio/ui/screens/home/home_screen.dart';
import 'package:hai_portfolio/ui/theme/theme.dart';




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GetMaterialApp(
      theme: AppTheme.of(context).lightTheme,
      darkTheme: AppTheme.of(context).darkTheme,
      home: const HomeScreen(),
    );
  }
}

