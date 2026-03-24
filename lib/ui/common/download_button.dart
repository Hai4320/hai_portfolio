import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/data/model/app.dart';
import 'package:hai_portfolio/data/repository/link_analytics_repository.dart';
import 'package:hai_portfolio/data/service/link_analytics_service.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

class DownloadButton extends StatefulWidget {
  final AppLink link;
  final String appName;

  const DownloadButton({super.key, required this.link, required this.appName});

  @override
  State<DownloadButton> createState() => _DownloadButtonState();
}

class _DownloadButtonState extends State<DownloadButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final icon = _getIconForPlatform();
    final label = _getLabelForPlatform();

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: InkWell(
        onTap: _handleDownloadClick,
        child: AnimatedScale(
          scale: _isHovering ? 0.98 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: AppColors.lightPeriwinkle, size: 16.r),
              SizedBox(width: 8.w),
              Text(
                label,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600, color: AppColors.lightPeriwinkle),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconData _getIconForPlatform() {
    return switch (widget.link.platform) {
      AppPlatform.playstore => Icons.play_arrow_rounded,
      AppPlatform.appstore => Icons.apple,
      AppPlatform.web => Icons.language_rounded,
    };
  }

  String _getLabelForPlatform() {
    return switch (widget.link.platform) {
      AppPlatform.playstore => 'Play Store',
      AppPlatform.appstore => 'App Store',
      AppPlatform.web => 'Open Web',
    };
  }

  void _handleDownloadClick() {
    final analyticsService = Get.find<LinkAnalyticsService>();

    analyticsService.openLink(
      url: widget.link.url,
      linkType: LinkType.other,
      linkText: '${widget.appName} - ${_getLabelForPlatform()}',
    );
  }
}
