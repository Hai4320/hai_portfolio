import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/data/repository/app_data.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/common/app_card.dart';
import 'package:hai_portfolio/ui/common/primary_button.dart';

class FeaturedAppsSection extends StatelessWidget {
  const FeaturedAppsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredApps = AppData.getFeaturedApps(limit: 3);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 200.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.strings.apps.featuredApps,
                style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900, height: 1.3),
              ),
              SizedBox(height: 16.h),
              Text(
                t.strings.apps.subtitle,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, height: 1.8),
              ),
            ],
          ),
        ),
        SizedBox(height: 48.h),
        // Apps Grid
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 200.w),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
              childAspectRatio: 0.9,
            ),
            itemCount: featuredApps.length,
            itemBuilder: (context, index) {
              final app = featuredApps[index];
              return AppCard(app: app, onTap: () => Get.toNamed('/apps/${app.id}'));
            },
          ),
        ),
        SizedBox(height: 48.h),
        // See All Button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 200.w),
          child: SizedBox(
            width: 300.w,
            child: PrimaryButton(label: t.strings.apps.seeMore, onTap: () => Get.toNamed('/apps')),
          ),
        ),
      ],
    );
  }
}
