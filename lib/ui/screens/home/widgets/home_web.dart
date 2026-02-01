import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/data/repository/project_data.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/common/image_link.dart';
import 'package:hai_portfolio/ui/common/language_switcher.dart';
import 'package:hai_portfolio/ui/common/primary_button.dart';
import 'package:hai_portfolio/ui/common/project_bloc.dart';
import 'package:hai_portfolio/ui/common/skill_badge.dart';
import 'package:hai_portfolio/ui/common/text_link.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/utils/gradient_text.dart';
import 'package:hai_portfolio/utils/locale_controller.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({super.key});

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  @override
  Widget build(BuildContext context) {
    final localeController = Get.find<LocaleController>();
    final contentPadding = 200.w;
    final sectionSpace = 140.h;

    return Obx(() {
      // Access currentLocale to trigger rebuild on change
      final _ = localeController.currentLocale;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 80.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: contentPadding),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(t.strings.app.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
                        const Spacer(),
                        const LanguageSwitcherCompact(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 80.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: contentPadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 700.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 100.h),
                              Text(
                                t.strings.home.title,
                                style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w900, height: 1.3),
                              ).gradient(),
                              SizedBox(height: 40.h),
                              Text(
                                t.strings.home.subtitle,
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w300, height: 1.8),
                              ),
                              SizedBox(height: 100.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      t.strings.home.skill1,
                                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w200, height: 1.8),
                                    ).gradient(),
                                  ),
                                  SizedBox(width: 120.w),
                                  Expanded(
                                    child: Text(
                                      t.strings.home.skill2,
                                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w200, height: 1.8),
                                    ).gradient(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const Expanded(child: SizedBox.shrink()),
                        Column(
                          children: [
                            Image.asset(t.images.avatar, width: 450.w),
                            Container(
                              width: 450.w,
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Container(
                                height: 50.h,
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: Colors.white),
                                    left: BorderSide(color: Colors.white),
                                    right: BorderSide(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: sectionSpace),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: contentPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 100.h),
                          Text(
                            t.strings.home.mobile.title,
                            style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w900),
                          ).gradient(),
                          SizedBox(height: 20.h),
                          Text(
                            t.strings.home.mobile.description,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, height: 1.8),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 300.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 100.h),
                          Text(
                            t.strings.home.engineering.title,
                            style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w900),
                          ).gradient(),
                          SizedBox(height: 20.h),
                          Text(
                            t.strings.home.engineering.description,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, height: 1.8),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: sectionSpace),
              // Skills Section
              Padding(
                padding: EdgeInsets.symmetric(horizontal: contentPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      t.strings.home.skills.title,
                      style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w900),
                    ).gradient(),
                    SizedBox(height: 40.h),
                    const SkillsSection(),
                  ],
                ),
              ),
              SizedBox(height: 400.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 120.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: AppColors.richBlack,
                          border: Border(right: BorderSide(color: AppColors.lightPeriwinkle)),
                        ),
                        padding: EdgeInsets.only(top: 140.h, bottom: 140.h, left: 120.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t.strings.home.build.title,
                              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w900, height: 1.3),
                            ).gradient(),
                            SizedBox(height: 20.h),
                            Text(
                              t.strings.home.build.description,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 80.h),
                            SizedBox(
                              width: 400.w,
                              child: PrimaryButton(label: t.strings.home.build.button, onTap: () {}),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top: 140.h, bottom: 140.h, left: 120.w),
                        decoration: const BoxDecoration(color: AppColors.richBlack),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              t.strings.home.support.title,
                              style: const TextStyle(fontSize: 50, fontWeight: FontWeight.w900, height: 1.3),
                            ).gradient(),
                            SizedBox(height: 20.h),
                            Text(
                              t.strings.home.support.description,
                              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 80.h),
                            SizedBox(
                              width: 400.w,
                              child: PrimaryButton(label: t.strings.home.support.button, onTap: () {}),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: sectionSpace),
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: AppColors.richBlack),
                padding: EdgeInsets.symmetric(vertical: 160.h),
                child: Column(
                  children: [
                    Text(
                      t.strings.home.experience.title,
                      style: const TextStyle(fontSize: 56, fontWeight: FontWeight.w900),
                    ).gradient(),
                    Text(
                      t.strings.home.experience.emoji,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, height: 1.8),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 700,
                      child: Text(
                        t.strings.home.experience.description,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: sectionSpace),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 200.w),
                child: Wrap(
                  spacing: 50.w,
                  runSpacing: 60.h,
                  children: ProjectData.projects
                      .map((project) => ProjectBloc(project: project))
                      .toList(),
                ),
              ),
              SizedBox(height: sectionSpace),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 200.w),
                child: Column(
                  children: [
                    SizedBox(
                      width: 600.w,
                      child: Text(
                        t.strings.home.thankYou.message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, height: 1.6),
                      ),
                    ),
                    SizedBox(height: 50.h),
                    Text(
                      t.strings.home.thankYou.title,
                      style: const TextStyle(fontSize: 60, fontWeight: FontWeight.w900, height: 1.3),
                    ).gradient(),
                  ],
                ),
              ),
              SizedBox(height: sectionSpace),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: contentPadding),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    t.strings.contact.title,
                    style: const TextStyle(fontSize: 18, color: AppColors.lightPeriwinkle),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: contentPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        TextLink(text: t.strings.contact.email, link: t.strings.links.email),
                        const SizedBox(height: 20),
                      ],
                    ),
                    const SizedBox(width: 150),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextLink(text: t.strings.contact.works, link: t.strings.links.email),
                        const SizedBox(height: 20),
                        TextLink(text: t.strings.contact.shelf, link: t.strings.links.github),
                        const SizedBox(height: 20),
                        TextLink(text: t.strings.contact.resume, link: t.strings.links.github),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 120.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: contentPadding),
                child: Column(
                  children: [
                    Container(height: 1, width: double.infinity, color: AppColors.lightPeriwinkle),
                    SizedBox(height: 30.h),
                    Row(
                      children: [
                        Text(
                          t.strings.footer.copyright,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            height: 1.6,
                            color: Colors.white,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        ImageLink(imageSvg: t.images.github, link: t.strings.links.github),
                        const SizedBox(width: 20),
                        ImageLink(imageSvg: t.images.linkedin, link: t.strings.links.linkedin),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: sectionSpace),
            ],
          ),
        ),
      );
    }); // Close Obx
  }
}
