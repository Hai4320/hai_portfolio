import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/data/repository/app_data.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/common/app_card.dart';
import 'package:hai_portfolio/ui/common/primary_button.dart';

class FeaturedAppsSectionPhone extends StatelessWidget {
  const FeaturedAppsSectionPhone({super.key});

  @override
  Widget build(BuildContext context) {
    final featuredApps = AppData.getFeaturedApps(limit: 3);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                t.strings.apps.featuredApps,
                style: TextStyle(fontSize: 28.sp, fontWeight: FontWeight.w900, height: 1.3),
              ),
              SizedBox(height: 12.h),
              Text(
                t.strings.apps.subtitle,
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w300, height: 1.8),
              ),
            ],
          ),
        ),
        SizedBox(height: 32.h),
        // Apps List
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: featuredApps.length,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              final app = featuredApps[index];
              return SizedBox(
                height: 180.h,
                child: AppCard(app: app, onTap: () => Get.toNamed('/apps/${app.id}')),
              );
            },
          ),
        ),
        SizedBox(height: 32.h),
        // See All Button
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SizedBox(
            width: double.infinity,
            child: PrimaryButton(label: t.strings.apps.seeMore, onTap: () => Get.toNamed('/apps')),
          ),
        ),
      ],
    );
  }
}
