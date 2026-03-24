import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/ui/common/response_layout.dart';
import 'package:hai_portfolio/ui/screens/apps/apps_controller.dart';
import 'package:hai_portfolio/ui/screens/apps/widgets/apps_phone.dart';
import 'package:hai_portfolio/ui/screens/apps/widgets/apps_web.dart';

class AppsScreen extends StatelessWidget {
  const AppsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    final controller = Get.put(AppsController());

    return Scaffold(
      body: ResponsiveLayout(
        webUI: Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.w, vertical: 48.h),
          child: AppsWeb(controller: controller),
        ),
        phoneUI: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: AppsPhone(controller: controller),
        ),
      ),
    );
  }
}
