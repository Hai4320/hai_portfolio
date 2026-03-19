import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/common/app_card.dart';
import 'package:hai_portfolio/ui/screens/apps/apps_controller.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/utils/gradient_text.dart';

class AppsPhone extends StatelessWidget {
  final AppsController controller;

  const AppsPhone({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back to Home button
          GestureDetector(
            onTap: () => Get.offAllNamed('/'),
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
                  const Text(
                    'Home',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: AppColors.lightPeriwinkle),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          // Header
          Text(
            t.strings.apps.title,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w900, height: 1.2),
          ).gradient(),
          SizedBox(height: 12.h),
          Text(
            t.strings.apps.subtitle,
            style: TextStyle(fontSize: 14, color: AppColors.lightPeriwinkle.withAlpha(179), height: 1.6),
          ),
          SizedBox(height: 24.h),
          // Stats row
          Obx(
            () => Row(
              children: [
                _MiniStat(
                  icon: Icons.apps_rounded,
                  value: '${controller.getTotalApps()}',
                  label: t.strings.apps.filters.all,
                ),
                SizedBox(width: 12.w),
                _MiniStat(
                  icon: Icons.star_rounded,
                  value: '${controller.getFeaturedAppsCount()}',
                  label: t.strings.apps.filters.featured,
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          // Divider
          Container(
            height: 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.lightPeriwinkle.withAlpha(0),
                  AppColors.lightPeriwinkle.withAlpha(77),
                  AppColors.lightPeriwinkle.withAlpha(0),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.h),
          // Filter buttons
          Obx(
            () => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _FilterChipMobile(
                    label: t.strings.apps.filters.all,
                    count: controller.getTotalApps(),
                    isSelected: controller.selectedFilter.value == 'all',
                    onTap: () => controller.setFilter('all'),
                  ),
                  SizedBox(width: 10.w),
                  _FilterChipMobile(
                    label: t.strings.apps.filters.featured,
                    count: controller.getFeaturedAppsCount(),
                    isSelected: controller.selectedFilter.value == 'featured',
                    onTap: () => controller.setFilter('featured'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 24.h),
          // Apps List
          Obx(
            () => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.filteredApps.length,
              separatorBuilder: (context, index) => SizedBox(height: 16.h),
              itemBuilder: (context, index) {
                final app = controller.filteredApps[index];
                return SizedBox(
                  height: 200.h,
                  child: AppCard(app: app, onTap: () => Get.toNamed('/apps/${app.id}')),
                );
              },
            ),
          ),
          SizedBox(height: 40.h),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final IconData icon;
  final String value;
  final String label;

  const _MiniStat({required this.icon, required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: AppColors.richBlack,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: AppColors.lightPeriwinkle, size: 16.r),
          SizedBox(width: 8.w),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
          ),
          SizedBox(width: 4.w),
          Text(label, style: TextStyle(fontSize: 11, color: AppColors.lightPeriwinkle.withAlpha(128))),
        ],
      ),
    );
  }
}

class _FilterChipMobile extends StatelessWidget {
  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChipMobile({required this.label, required this.count, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xff7F7FD5), Color(0xff86A8E7), Color(0xff91EAE4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : AppColors.black1,
          borderRadius: BorderRadius.circular(24.r),
          border: Border.all(color: isSelected ? Colors.transparent : AppColors.lightPeriwinkle.withAlpha(26)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : AppColors.lightPeriwinkle,
              ),
            ),
            SizedBox(width: 6.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white.withAlpha(51) : AppColors.lightPeriwinkle.withAlpha(26),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Text(
                '$count',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Colors.white : AppColors.lightPeriwinkle.withAlpha(179),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
