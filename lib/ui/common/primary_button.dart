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
          height: 60.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: hovering ? Colors.grey : Colors.transparent,
            border: Border.all(color: AppColors.lightPeriwinkle),
          ),
          child: Center(child: Text(widget.label)),
        ),
      ),
    );
  }
}
