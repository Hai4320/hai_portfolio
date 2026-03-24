import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/common/app_card.dart';
import 'package:hai_portfolio/ui/common/back_navigation_button.dart';
import 'package:hai_portfolio/ui/screens/apps/apps_controller.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/utils/gradient_text.dart';

class AppsWeb extends StatelessWidget {
  final AppsController controller;

  const AppsWeb({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Back to Home button
          BackNavigationButton(label: 'Home', onTap: () => Get.offAllNamed('/')),
          SizedBox(height: 40.h),
          // Header with gradient title and stats
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.strings.apps.title,
                style: const TextStyle(fontSize: 56, fontWeight: FontWeight.w900, height: 1.2),
              ).gradient(),
              SizedBox(height: 16.h),
              Text(
                t.strings.apps.subtitle,
                style: TextStyle(fontSize: 18, color: AppColors.lightPeriwinkle.withAlpha(179), height: 1.6),
                maxLines: 2,
              ),
            ],
          ),
          SizedBox(height: 48.h),
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
          SizedBox(height: 40.h),
          // Filter buttons
          Obx(
            () => Row(
              children: [
                _FilterChip(
                  label: t.strings.apps.filters.all,
                  count: controller.getTotalApps(),
                  isSelected: controller.selectedFilter.value == 'all',
                  onTap: () => controller.setFilter('all'),
                ),
                SizedBox(width: 12.w),
                _FilterChip(
                  label: t.strings.apps.filters.featured,
                  count: controller.getFeaturedAppsCount(),
                  isSelected: controller.selectedFilter.value == 'featured',
                  onTap: () => controller.setFilter('featured'),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.h),
          // Apps Grid
          Obx(
            () => GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 350.w,
                crossAxisSpacing: 24.w,
                mainAxisSpacing: 24.h,
                childAspectRatio: 0.9,
              ),
              itemCount: controller.filteredApps.length,
              itemBuilder: (context, index) {
                final app = controller.filteredApps[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppCard(app: app, onTap: () => Get.toNamed('/apps/${app.id}')),
                );
              },
            ),
          ),
          SizedBox(height: 60.h),
        ],
      ),
    );
  }
}

class _FilterChip extends StatefulWidget {
  final String label;
  final int count;
  final bool isSelected;
  final VoidCallback onTap;

  const _FilterChip({required this.label, required this.count, required this.isSelected, required this.onTap});

  @override
  State<_FilterChip> createState() => __FilterChipState();
}

class __FilterChipState extends State<_FilterChip> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
          decoration: BoxDecoration(
            gradient: widget.isSelected
                ? const LinearGradient(
                    colors: [Color(0xff7F7FD5), Color(0xff86A8E7), Color(0xff91EAE4)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  )
                : null,
            color: widget.isSelected
                ? null
                : _isHovering
                ? AppColors.richBlack
                : AppColors.black1,
            borderRadius: BorderRadius.circular(30.r),
            border: Border.all(
              color: widget.isSelected
                  ? Colors.transparent
                  : _isHovering
                  ? AppColors.lightPeriwinkle.withAlpha(77)
                  : AppColors.lightPeriwinkle.withAlpha(26),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: widget.isSelected ? Colors.white : AppColors.lightPeriwinkle,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
                decoration: BoxDecoration(
                  color: widget.isSelected ? Colors.white.withAlpha(51) : AppColors.lightPeriwinkle.withAlpha(26),
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  '${widget.count}',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: widget.isSelected ? Colors.white : AppColors.lightPeriwinkle.withAlpha(179),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
