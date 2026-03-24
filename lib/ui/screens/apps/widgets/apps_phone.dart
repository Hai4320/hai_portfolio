import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/data/model/app.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/common/back_navigation_button.dart';
import 'package:hai_portfolio/ui/screens/apps/apps_controller.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/utils/format.dart';
import 'package:hai_portfolio/utils/gradient_text.dart';

class AppsPhone extends StatelessWidget {
  final AppsController controller;

  const AppsPhone({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          BackNavigationButton(label: 'Home', onTap: () => Get.offAllNamed('/'), compact: true),
          const SizedBox(height: 28),

          // Header
          Text(
            t.strings.apps.title,
            style: const TextStyle(fontSize: 34, fontWeight: FontWeight.w900, height: 1.2),
          ).gradient(),
          const SizedBox(height: 10),
          Text(
            t.strings.apps.subtitle,
            style: TextStyle(fontSize: 14, color: AppColors.lightPeriwinkle.withAlpha(179), height: 1.6),
          ),
          const SizedBox(height: 24),

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
          const SizedBox(height: 20),

          // Filter chips
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
                  const SizedBox(width: 10),
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
          const SizedBox(height: 20),

          // Apps list
          Obx(
            () => ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.filteredApps.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, index) {
                final app = controller.filteredApps[index];
                return _PhoneAppCard(app: app, onTap: () => Get.toNamed('/apps/${app.id}'));
              },
            ),
          ),
          const SizedBox(height: 48),
        ],
      ),
    );
  }
}

// ── Phone-specific horizontal app card ──────────────────────────────────────

class _PhoneAppCard extends StatelessWidget {
  final App app;
  final VoidCallback onTap;

  const _PhoneAppCard({required this.app, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: AppColors.black1,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.lightPeriwinkle.withAlpha(26)),
        ),
        child: Row(
          children: [
            // App icon
            Container(
              width: 64,
              height: 64,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: AppColors.richBlack),
              clipBehavior: Clip.antiAlias,
              child: Image.asset(
                app.iconPath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) =>
                    Center(child: Icon(Icons.apps, color: AppColors.lightPeriwinkle.withAlpha(128), size: 28)),
              ),
            ),
            const SizedBox(width: 14),

            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name + featured badge
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          app.name,
                          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (app.isFeatured) ...[
                        const SizedBox(width: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                          decoration: BoxDecoration(
                            color: AppColors.lightPeriwinkle.withAlpha(26),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Featured',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: AppColors.lightPeriwinkle,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Short description
                  Text(
                    app.shortDescription,
                    style: TextStyle(fontSize: 12, color: AppColors.lightPeriwinkle.withAlpha(153), height: 1.4),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Rating + downloads
                  Row(
                    children: [
                      const Icon(Icons.star_rounded, color: Colors.amber, size: 13),
                      const SizedBox(width: 3),
                      Text(
                        '${app.metadata.rating}',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.lightPeriwinkle.withAlpha(179),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        width: 3,
                        height: 3,
                        decoration: BoxDecoration(
                          color: AppColors.lightPeriwinkle.withAlpha(77),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${formatDownloads(app.metadata.downloads)} downloads',
                          style: TextStyle(fontSize: 12, color: AppColors.lightPeriwinkle.withAlpha(128)),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward_ios_rounded, size: 13, color: AppColors.lightPeriwinkle.withAlpha(100)),
          ],
        ),
      ),
    );
  }
}

// ── Filter chip ──────────────────────────────────────────────────────────────

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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  colors: [Color(0xff7F7FD5), Color(0xff86A8E7), Color(0xff91EAE4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null,
          color: isSelected ? null : AppColors.black1,
          borderRadius: BorderRadius.circular(24),
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
            const SizedBox(width: 6),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: isSelected ? Colors.white.withAlpha(51) : AppColors.lightPeriwinkle.withAlpha(26),
                borderRadius: BorderRadius.circular(10),
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
