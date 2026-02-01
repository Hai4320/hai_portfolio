import 'package:flutter/material.dart';
import 'package:hai_portfolio/ui/common/response_layout.dart';
import 'package:hai_portfolio/ui/screens/home/widgets/home_phone.dart';
import 'package:hai_portfolio/ui/screens/home/widgets/home_web.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(webUI: const HomeWeb(), phoneUI: const HomePhone());
  }
}
