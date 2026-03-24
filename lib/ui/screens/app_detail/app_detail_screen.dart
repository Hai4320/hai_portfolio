import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/ui/common/back_navigation_button.dart';
import 'package:hai_portfolio/ui/common/response_layout.dart';
import 'package:hai_portfolio/ui/screens/app_detail/app_detail_controller.dart';
import 'package:hai_portfolio/ui/screens/app_detail/widgets/app_detail_phone.dart';
import 'package:hai_portfolio/ui/screens/app_detail/widgets/app_detail_web.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

class AppDetailScreen extends StatelessWidget {
  const AppDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppDetailController());

    if (!controller.hasApp) {
      return Scaffold(body: _AppNotFound());
    }

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

class _AppNotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.app_blocking_rounded, color: AppColors.lightPeriwinkle.withAlpha(128), size: 64.r),
          SizedBox(height: 24.h),
          const Text(
            'App not found',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          SizedBox(height: 12.h),
          Text(
            'The app you are looking for does not exist.',
            style: TextStyle(fontSize: 14, color: AppColors.lightPeriwinkle.withAlpha(179)),
          ),
          SizedBox(height: 32.h),
          BackNavigationButton(label: 'Back to Apps', onTap: () => Get.offAllNamed('/apps')),
        ],
      ),
    );
  }
}
