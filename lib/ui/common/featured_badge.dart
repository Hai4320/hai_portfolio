import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FeaturedBadge extends StatelessWidget {
  final bool compact;

  const FeaturedBadge({super.key, this.compact = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: compact ? 10.w : 12.w, vertical: compact ? 5.h : 6.h),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xff7F7FD5), Color(0xff86A8E7)]),
        borderRadius: BorderRadius.circular(6.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, color: Colors.white, size: compact ? 12 : 14),
          SizedBox(width: 4.w),
          Text(
            'Featured',
            style: TextStyle(fontSize: compact ? 11 : 12, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
