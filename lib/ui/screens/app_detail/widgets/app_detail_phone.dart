import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/common/back_navigation_button.dart';
import 'package:hai_portfolio/ui/common/download_button.dart';
import 'package:hai_portfolio/ui/common/feature_badge.dart';
import 'package:hai_portfolio/ui/common/featured_badge.dart';
import 'package:hai_portfolio/ui/common/metadata_chip.dart';
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
          BackNavigationButton(label: 'Back', onTap: () => Get.back(), compact: true),
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
                  const FeaturedBadge(compact: true),
                ],
                SizedBox(height: 16.h),
                // Metadata chips
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 8.w,
                  runSpacing: 8.h,
                  children: [
                    MetadataChip(
                      icon: Icons.star_rounded,
                      iconColor: Colors.amber,
                      text: '${app.metadata.rating}',
                      compact: true,
                    ),
                    MetadataChip(icon: Icons.update_rounded, text: 'v${app.metadata.version}', compact: true),
                    MetadataChip(icon: Icons.sd_storage_rounded, text: app.metadata.size, compact: true),
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
          // Terms of use section — collapsible
          if (app.termsOfUse.isNotEmpty)
            _CollapsibleTermsOfUsePhone(termsOfUse: app.termsOfUse),
          SizedBox(height: 32.h),
        ],
      ),
    );
  }
}

class _CollapsibleTermsOfUsePhone extends StatefulWidget {
  final String termsOfUse;
  const _CollapsibleTermsOfUsePhone({required this.termsOfUse});

  @override
  State<_CollapsibleTermsOfUsePhone> createState() => _CollapsibleTermsOfUsePhoneState();
}

class _CollapsibleTermsOfUsePhoneState extends State<_CollapsibleTermsOfUsePhone> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.richBlack,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26)),
      ),
      child: Column(
        children: [
          // Header — always visible, clickable
          GestureDetector(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            child: Padding(
              padding: EdgeInsets.all(16.r),
              child: Row(
                children: [
                  Icon(Icons.description_outlined, color: AppColors.lightPeriwinkle, size: 16.r),
                  SizedBox(width: 8.w),
                  Text(
                    t.strings.apps.termsOfUse,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  const Spacer(),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(Icons.expand_more_rounded, color: AppColors.lightPeriwinkle, size: 20.r),
                  ),
                ],
              ),
            ),
          ),
          // Content — animated expand/collapse
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: EdgeInsets.fromLTRB(16.r, 0, 16.r, 16.r),
              child: Text(
                widget.termsOfUse,
                style: TextStyle(fontSize: 12, color: AppColors.lightPeriwinkle.withAlpha(179), height: 1.8),
              ),
            ),
            crossFadeState: _isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
        ],
      ),
    );
  }
}
