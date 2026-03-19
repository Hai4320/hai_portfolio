import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

class BackNavigationButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;
  final bool compact;

  const BackNavigationButton({super.key, required this.label, required this.onTap, this.compact = false});

  @override
  State<BackNavigationButton> createState() => _BackNavigationButtonState();
}

class _BackNavigationButtonState extends State<BackNavigationButton> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    if (widget.compact) {
      return GestureDetector(
        onTap: widget.onTap,
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
              Text(
                widget.label,
                style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.lightPeriwinkle),
              ),
            ],
          ),
        ),
      );
    }

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: _isHovering ? AppColors.richBlack : Colors.transparent,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: _isHovering ? AppColors.lightPeriwinkle.withAlpha(77) : Colors.transparent),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedSlide(
                duration: const Duration(milliseconds: 200),
                offset: _isHovering ? const Offset(-0.2, 0) : Offset.zero,
                child: Icon(Icons.arrow_back_rounded, color: AppColors.lightPeriwinkle, size: 18.r),
              ),
              SizedBox(width: 8.w),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: _isHovering ? Colors.white : AppColors.lightPeriwinkle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

