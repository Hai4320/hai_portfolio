import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

class MetadataChip extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final bool compact;

  const MetadataChip({super.key, required this.icon, required this.text, this.iconColor, this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: compact ? 10.w : 12.w, vertical: compact ? 5.h : 6.h),
      decoration: BoxDecoration(
        color: AppColors.black1,
        borderRadius: BorderRadius.circular(compact ? 6.r : 8.r),
        border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: iconColor ?? AppColors.lightPeriwinkle, size: compact ? 14.r : 16.r),
          SizedBox(width: compact ? 4.w : 6.w),
          Text(
            text,
            style: TextStyle(
              fontSize: compact ? 12 : 13,
              color: AppColors.lightPeriwinkle.withAlpha(179),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
