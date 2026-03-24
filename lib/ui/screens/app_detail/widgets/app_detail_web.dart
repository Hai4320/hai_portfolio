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
import 'package:hai_portfolio/utils/format.dart';
import 'package:hai_portfolio/utils/gradient_text.dart';

class AppDetailWeb extends StatelessWidget {
  final AppDetailController controller;

  const AppDetailWeb({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final app = controller.app;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back button
          BackNavigationButton(label: 'Back to Apps', onTap: () => Get.back()),
          SizedBox(height: 40.h),
          // Hero section with gradient background
          Container(
            padding: EdgeInsets.all(40.r),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App icon
                Container(
                  width: 120.r,
                  height: 120.r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28.r),
                    color: AppColors.black1,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withAlpha(77), blurRadius: 20, offset: const Offset(0, 8)),
                    ],
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: Image.asset(
                    app.iconPath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(Icons.apps, color: AppColors.lightPeriwinkle.withAlpha(128), size: 48.r),
                      );
                    },
                  ),
                ),
                SizedBox(width: 40.w),
                // App info
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name and featured badge
                      Row(
                        children: [
                          Flexible(
                            child: Text(
                              app.name,
                              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w900),
                            ).gradient(),
                          ),
                          if (app.isFeatured) ...[SizedBox(width: 16.w), const FeaturedBadge()],
                        ],
                      ),
                      SizedBox(height: 20.h),
                      // Metadata chips
                      Wrap(
                        spacing: 16.w,
                        runSpacing: 8.h,
                        children: [
                          MetadataChip(
                            icon: Icons.star_rounded,
                            iconColor: Colors.amber,
                            text: '${app.metadata.rating}',
                          ),
                          MetadataChip(
                            icon: Icons.update_rounded,
                            text: '${t.strings.apps.appMetadata.version}: ${app.metadata.version}',
                          ),
                          MetadataChip(
                            icon: Icons.sd_storage_rounded,
                            text: '${t.strings.apps.appMetadata.size}: ${app.metadata.size}',
                          ),
                          MetadataChip(
                            icon: Icons.download_rounded,
                            text: '${formatDownloads(app.metadata.downloads)} downloads',
                          ),
                        ],
                      ),
                      SizedBox(height: 28.h),
                      // Download buttons
                      Wrap(
                        spacing: 16.w,
                        runSpacing: 12.h,
                        children: app.links
                            .map(
                              (link) => _StyledDownloadButton(
                                child: DownloadButton(link: link, appName: app.name),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 48.h),
          // Description section
          Container(
            padding: EdgeInsets.all(32.r),
            decoration: BoxDecoration(
              color: AppColors.richBlack,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'About',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white),
                ),
                SizedBox(height: 16.h),
                Text(
                  app.fullDescription,
                  style: TextStyle(fontSize: 16, color: AppColors.lightPeriwinkle.withAlpha(179), height: 1.8),
                ),
              ],
            ),
          ),
          SizedBox(height: 48.h),
          // Screenshots section
          if (app.screenshotPaths.isNotEmpty) ...[
            Text(
              t.strings.apps.screenshots,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
            ),
            SizedBox(height: 24.h),
            ScreenshotCarousel(screenshotPaths: app.screenshotPaths, height: 400),
            SizedBox(height: 48.h),
          ],
          // Features section
          if (app.features.isNotEmpty) ...[
            Text(
              t.strings.apps.features,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.white),
            ),
            SizedBox(height: 24.h),
            Wrap(
              spacing: 12.w,
              runSpacing: 12.h,
              children: app.features.map((feature) => FeatureBadge(label: feature)).toList(),
            ),
            SizedBox(height: 48.h),
          ],
          // Terms of use section — collapsible
          if (app.termsOfUse.isNotEmpty) _CollapsibleTermsOfUse(termsOfUse: app.termsOfUse),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}

class _CollapsibleTermsOfUse extends StatefulWidget {
  final String termsOfUse;
  const _CollapsibleTermsOfUse({required this.termsOfUse});

  @override
  State<_CollapsibleTermsOfUse> createState() => _CollapsibleTermsOfUseState();
}

class _CollapsibleTermsOfUseState extends State<_CollapsibleTermsOfUse> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.richBlack,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26)),
      ),
      child: Column(
        children: [
          // Header — always visible, clickable
          InkWell(
            onTap: () => setState(() => _isExpanded = !_isExpanded),
            borderRadius: BorderRadius.circular(16.r),
            child: Padding(
              padding: EdgeInsets.all(28.r),
              child: Row(
                children: [
                  Icon(Icons.description_outlined, color: AppColors.lightPeriwinkle, size: 20.r),
                  SizedBox(width: 10.w),
                  Text(
                    t.strings.apps.termsOfUse,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                  const Spacer(),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 300),
                    child: Icon(Icons.expand_more_rounded, color: AppColors.lightPeriwinkle, size: 24.r),
                  ),
                ],
              ),
            ),
          ),
          // Content — animated expand/collapse
          AnimatedCrossFade(
            firstChild: const SizedBox.shrink(),
            secondChild: Padding(
              padding: EdgeInsets.fromLTRB(28.r, 0, 28.r, 28.r),
              child: Text(
                widget.termsOfUse,
                style: TextStyle(fontSize: 13, color: AppColors.lightPeriwinkle.withAlpha(179), height: 1.8),
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

class _StyledDownloadButton extends StatefulWidget {
  final Widget child;
  const _StyledDownloadButton({required this.child});

  @override
  State<_StyledDownloadButton> createState() => __StyledDownloadButtonState();
}

class __StyledDownloadButtonState extends State<_StyledDownloadButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: _isHovering ? AppColors.lightPeriwinkle.withAlpha(26) : AppColors.black1,
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(
            color: _isHovering ? AppColors.lightPeriwinkle.withAlpha(77) : AppColors.lightPeriwinkle.withAlpha(26),
          ),
        ),
        child: widget.child,
      ),
    );
  }
}
