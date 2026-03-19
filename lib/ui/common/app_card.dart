import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hai_portfolio/data/model/app.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

class AppCard extends StatefulWidget {
  final App app;
  final VoidCallback onTap;
  final bool isHovering;

  const AppCard({super.key, required this.app, required this.onTap, this.isHovering = false});

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovering ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.black1,
              borderRadius: BorderRadius.circular(16.r),
              border: Border.all(color: _isHovering ? AppColors.lightPeriwinkle : AppColors.richBlack, width: 1),
              boxShadow: _isHovering
                  ? [
                      BoxShadow(
                        color: AppColors.lightPeriwinkle.withAlpha(26),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : [],
            ),
            child: Stack(
              children: [
                // App icon and basic info
                Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Icon
                      Container(
                        width: 48.r,
                        height: 48.r,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.r),
                          color: AppColors.richBlack,
                        ),
                        child: Image.asset(
                          widget.app.iconPath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(Icons.apps, color: AppColors.lightPeriwinkle.withAlpha(128), size: 24.r),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 12.h),
                      // App name
                      Text(
                        widget.app.name,
                        style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600, color: Colors.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8.h),
                      // Short description
                      Text(
                        widget.app.shortDescription,
                        style: TextStyle(fontSize: 13.sp, color: AppColors.lightPeriwinkle.withAlpha(179), height: 1.4),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 12.h),
                      // Rating and downloads
                      Row(
                        children: [
                          // Rating
                          Row(
                            children: [
                              Icon(Icons.star_rounded, color: Colors.amber, size: 16.r),
                              SizedBox(width: 4.w),
                              Text(
                                widget.app.metadata.rating.toString(),
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: AppColors.lightPeriwinkle.withAlpha(179),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 12.w),
                          // Downloads
                          Text(
                            '${_formatDownloads(widget.app.metadata.downloads)} dl',
                            style: TextStyle(fontSize: 12.sp, color: AppColors.lightPeriwinkle.withAlpha(179)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Featured badge
                if (widget.app.isFeatured)
                  Positioned(
                    top: 12.r,
                    right: 12.r,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                      decoration: BoxDecoration(
                        color: AppColors.lightPeriwinkle,
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        'Featured',
                        style: TextStyle(fontSize: 10.sp, fontWeight: FontWeight.w600, color: AppColors.black1),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _formatDownloads(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }
}
