import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/ui/common/response_layout.dart';
import 'package:hai_portfolio/ui/screens/app_detail/app_detail_controller.dart';
import 'package:hai_portfolio/ui/screens/app_detail/widgets/app_detail_phone.dart';
import 'package:hai_portfolio/ui/screens/app_detail/widgets/app_detail_web.dart';

class AppDetailScreen extends StatelessWidget {
  const AppDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppDetailController());

    return Scaffold(
      body: ResponsiveLayout(
        webUI: Padding(
          padding: EdgeInsets.symmetric(horizontal: 120.w, vertical: 48.h),
          child: AppDetailWeb(controller: controller),
        ),
        phoneUI: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          child: AppDetailPhone(controller: controller),
        ),
      ),
    );
  }
}
