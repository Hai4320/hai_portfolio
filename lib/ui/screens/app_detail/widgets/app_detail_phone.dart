import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/common/download_button.dart';
import 'package:hai_portfolio/ui/common/feature_badge.dart';
import 'package:hai_portfolio/ui/common/screenshot_carousel.dart';
import 'package:hai_portfolio/ui/screens/app_detail/app_detail_controller.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/utils/gradient_text.dart';

class AppDetailPhone extends StatelessWidget {
  final AppDetailController controller;

  const AppDetailPhone({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final app = controller.app;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button
          GestureDetector(
            onTap: () => Get.back(),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.richBlack,
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(51)),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back_rounded, color: AppColors.lightPeriwinkle, size: 16.r),
                  SizedBox(width: 6.w),
                  const Text(
                    'Back',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.lightPeriwinkle),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          // Hero section with gradient background
          Container(
            padding: EdgeInsets.all(20.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
              gradient: LinearGradient(
                colors: [
                  const Color(0xff7F7FD5).withAlpha(26),
                  const Color(0xff86A8E7).withAlpha(13),
                  AppColors.richBlack,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26)),
            ),
            child: Column(
              children: [
                // App icon
                Container(
                  width: 90.r,
                  height: 90.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22.r),
                    color: AppColors.black1,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(77), blurRadius: 16, offset: const Offset(0, 6)),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    app.iconPath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(Icons.apps, color: AppColors.lightPeriwinkle.withAlpha(128), size: 36.r),
                      );
                    },
                  ),
                ),
                SizedBox(height: 16.h),
                // App name
                Text(
                  app.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900),
                ).gradient(),
                if (app.isFeatured) ...[
                  SizedBox(height: 10.h),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xff7F7FD5), Color(0xff86A8E7)]),
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.star_rounded, color: Colors.white, size: 12),
                        SizedBox(width: 4),
                        Text(
                          'Featured',
                          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
                SizedBox(height: 16.h),
                // Metadata chips
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: [
                    _MetadataChipMobile(
                      icon: Icons.star_rounded,
                      iconColor: Colors.amber,
                      text: '${app.metadata.rating}',
                    ),
                    _MetadataChipMobile(icon: Icons.update_rounded, text: 'v${app.metadata.version}'),
                    _MetadataChipMobile(icon: Icons.sd_storage_rounded, text: app.metadata.size),
                  ],
                ),
                SizedBox(height: 20.h),
                // Download buttons
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: app.links
                      .map(
                        (link) => Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
                          decoration: BoxDecoration(
                            color: AppColors.black1,
                            borderRadius: BorderRadius.circular(8.r),
                            border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26)),
                          ),
                          child: DownloadButton(link: link, appName: app.name),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          // Description section
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.richBlack,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
                ),
                SizedBox(height: 12.h),
                Text(
                  app.fullDescription,
                  style: TextStyle(fontSize: 14, color: AppColors.lightPeriwinkle.withAlpha(179), height: 1.8),
                ),
              ],
            ),
          ),
          SizedBox(height: 28.h),
          // Screenshots section
          if (app.screenshotPaths.isNotEmpty) ...[
            Text(
              t.strings.apps.screenshots,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
            ),
            SizedBox(height: 16.h),
            ScreenshotCarousel(screenshotPaths: app.screenshotPaths, height: 300),
            SizedBox(height: 28.h),
          ],
          // Features section
          if (app.features.isNotEmpty) ...[
            Text(
              t.strings.apps.features,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
            ),
            SizedBox(height: 16.h),
            Wrap(
              spacing: 8.w,
              runSpacing: 8.h,
              children: app.features.map((feature) => FeatureBadge(label: feature)).toList(),
            ),
            SizedBox(height: 28.h),
          ],
          // Terms of use section
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.richBlack,
              borderRadius: BorderRadius.circular(12.r),
              border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.description_outlined, color: AppColors.lightPeriwinkle, size: 16.r),
                    SizedBox(width: 8.w),
                    Text(
                      t.strings.apps.termsOfUse,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 12.h),
                Text(
                  _getTermsOfUse(app.termsOfUseKey),
                  style: TextStyle(fontSize: 12, color: AppColors.lightPeriwinkle.withAlpha(179), height: 1.8),
                ),
              ],
            ),
          ),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }

  String _getTermsOfUse(String key) {
    if (key == 'apps.health_tracker.terms_of_use') {
      return t.strings.apps.healthTracker.termsOfUse;
    } else if (key == 'apps.food_delivery.terms_of_use') {
      return t.strings.apps.foodDelivery.termsOfUse;
    } else if (key == 'apps.drama_stream.terms_of_use') {
      return t.strings.apps.dramaStream.termsOfUse;
    } else if (key == 'apps.sleep_analytics.terms_of_use') {
      return t.strings.apps.sleepAnalytics.termsOfUse;
    } else if (key == 'apps.pachinko_master.terms_of_use') {
      return t.strings.apps.pachinkoMaster.termsOfUse;
    } else if (key == 'apps.retail_navigator.terms_of_use') {
      return t.strings.apps.retailNavigator.termsOfUse;
    }
    return '';
  }
}

class _MetadataChipMobile extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;

  const _MetadataChipMobile({required this.icon, required this.text, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
      decoration: BoxDecoration(
        color: AppColors.black1,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor ?? AppColors.lightPeriwinkle, size: 14.r),
          SizedBox(width: 4.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: AppColors.lightPeriwinkle.withAlpha(179),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
