import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/ui/screens/home/home_screen.dart';
import 'package:hai_portfolio/ui/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

