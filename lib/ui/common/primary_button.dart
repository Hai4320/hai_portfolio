import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';

class PrimaryButton extends StatefulWidget {
  const PrimaryButton({
    super.key,
    this.onTap,
    required this.label,
  });

  final Function()? onTap;
  final String label;

  @override
  State<PrimaryButton> createState() => _PrimaryButtonState();
}

class _PrimaryButtonState extends State<PrimaryButton> {
  bool hovering = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (PointerEnterEvent event) {
          setState(() {
            hovering = true;
          });
        },
        onExit: (PointerExitEvent event) {
          setState(() {
            hovering = false;
          });
        },
        child: Container(
          height: 80.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: hovering ? Colors.grey.withOpacity(0.3) : Colors.transparent,
            gradient: hovering
                ? const LinearGradient(colors: [
                    Color(0xFFFDE1FF),
                    Color(0xFFE0E7FF),
                    Color(0xFFE0F9FF),
                    Color(0xFFFFFAE9),
                    Color(0xFFE8EAFF),
                    Color(0xFFFFE3F7),
                    Color(0xFFDAF1FF),
                    Color(0xFFFDE1FF),
                    Color(0xFFE0E7FF),
                    Color(0xFFE0F9FF),
                    Color(0xFFFFFAE9),
                    Color(0xFFE8EAFF),
                    Color(0xFFFFE3F7),
                    Color(0xFFDAF1FF),
                    Color(0xFFFDE1FF),
                    Color(0xFFE0E7FF),
                    Color(0xFFE0F9FF),
                    Color(0xFFFFFAE9),
                    Color(0xFFE8EAFF),
                    Color(0xFFFFE3F7),
                    Color(0xFFDAF1FF),
                  ])
                : null,
            border: Border.all(color: AppColors.lightPeriwinkle),
          ),
          child: Center(
              child: Text(
            widget.label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.lightPeriwinkle,
            ),
          )),
        ),
      ),
    );
  }
}
