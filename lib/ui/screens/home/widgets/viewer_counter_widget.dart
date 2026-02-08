import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/ui/screens/home/viewer_controller.dart';

class ViewerCounterWidget extends StatelessWidget {
  final double? fontSize;
  final Color? textColor;
  final Color? iconColor;
  final bool isCompact;
  final bool hideIcon;

  const ViewerCounterWidget({
    super.key,
    this.fontSize,
    this.textColor,
    this.iconColor,
    this.isCompact = false,
    this.hideIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ViewerController>();

    return Obx(() {
      if (controller.isLoading.value) {
        return isCompact
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.visibility_outlined, size: fontSize ?? 16, color: iconColor ?? Colors.white70),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: 10,
                    height: 10,
                    child: CircularProgressIndicator(
                      strokeWidth: 1.5,
                      valueColor: AlwaysStoppedAnimation<Color>(textColor ?? Colors.white70),
                    ),
                  ),
                ],
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.visibility_outlined, size: fontSize ?? 16, color: iconColor ?? Colors.white70),
                  const SizedBox(width: 8),
                  SizedBox(
                    width: 12,
                    height: 12,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(textColor ?? Colors.white70),
                    ),
                  ),
                ],
              );
      }

      if (isCompact) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!hideIcon) ...[
              Icon(Icons.visibility_outlined, size: fontSize ?? 16, color: iconColor ?? Colors.white70),
              const SizedBox(width: 4),
            ],
            Text(
              _formatViewerCount(controller.viewerCount.value),
              style: TextStyle(
                fontSize: fontSize ?? 14,
                color: textColor ?? Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'views',
              style: TextStyle(fontSize: fontSize ?? 14, color: textColor ?? Colors.white70),
            ),
          ],
        );
      }

      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.visibility_outlined, size: fontSize ?? 16, color: iconColor ?? Colors.white70),
          const SizedBox(width: 8),
          Text(
            _formatViewerCount(controller.viewerCount.value),
            style: TextStyle(fontSize: fontSize ?? 14, color: textColor ?? Colors.white70, fontWeight: FontWeight.w500),
          ),
          const SizedBox(width: 4),
          Text(
            'viewers',
            style: TextStyle(fontSize: fontSize ?? 14, color: textColor ?? Colors.white70),
          ),
        ],
      );
    });
  }

  String _formatViewerCount(int count) {
    if (count >= 1000000) {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    } else if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}K';
    }
    return count.toString();
  }
}
