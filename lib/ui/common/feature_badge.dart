import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

class FeatureBadge extends StatelessWidget {
  final String label;
  final Color? backgroundColor;
  final Color? textColor;

  const FeatureBadge({super.key, required this.label, this.backgroundColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.richBlack,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26), width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 13.sp,
          fontWeight: FontWeight.w500,
          color: textColor ?? AppColors.lightPeriwinkle.withAlpha(179),
        ),
      ),
    );
  }
}
