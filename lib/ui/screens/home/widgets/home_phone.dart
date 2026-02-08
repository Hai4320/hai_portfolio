import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/data/repository/project_data.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/common/image_link.dart';
import 'package:hai_portfolio/ui/common/language_switcher.dart';
import 'package:hai_portfolio/ui/common/primary_button.dart';
import 'package:hai_portfolio/ui/common/project_bloc.dart';
import 'package:hai_portfolio/ui/common/skill_badge.dart';
import 'package:hai_portfolio/ui/common/text_link.dart';
import 'package:hai_portfolio/ui/screens/home/widgets/viewer_counter_widget.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/utils/gradient_text.dart';
import 'package:hai_portfolio/utils/locale_controller.dart';

class HomePhone extends StatefulWidget {
  const HomePhone({super.key});

  @override
  State<HomePhone> createState() => _HomePhoneState();
}

class _HomePhoneState extends State<HomePhone> {
  @override
  Widget build(BuildContext context) {
    final localeController = Get.find<LocaleController>();
    const contentPadding = 24.0;
    const sectionSpace = 60.0;

    return Obx(() {
      // Access currentLocale to trigger rebuild on change
      final _ = localeController.currentLocale;
      return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: contentPadding),
                child: Row(
                  children: [
                    Text(t.strings.app.name, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w400)),
                    const Spacer(),
                    const LanguageSwitcherCompact(),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              // Hero Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: contentPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset(t.images.avatar, width: MediaQuery.of(context).size.width * 0.7)),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Container(
                          height: 30,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.white),
                              left: BorderSide(color: Colors.white),
                              right: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      t.strings.home.title,
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900, height: 1.3),
                    ).gradient(),
                    const SizedBox(height: 20),
                    Text(
                      t.strings.home.subtitle,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300, height: 1.8),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      t.strings.home.skill1,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200, height: 1.8),
                    ).gradient(),
                    const SizedBox(height: 20),
                    Text(
                      t.strings.home.skill2,
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w200, height: 1.8),
                    ).gradient(),
                  ],
                ),
              ),
              const SizedBox(height: sectionSpace),
              // Skills Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: contentPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.strings.home.mobile.title,
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    ).gradient(),
                    const SizedBox(height: 16),
                    Text(
                      t.strings.home.mobile.description,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300, height: 1.8),
                    ),
                    const SizedBox(height: 40),
                    Text(
                      t.strings.home.engineering.title,
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    ).gradient(),
                    const SizedBox(height: 16),
                    Text(
                      t.strings.home.engineering.description,
                      style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w300, height: 1.8),
                    ),
                    const SizedBox(height: 40),
                    // Skills Section
                    Text(
                      t.strings.home.skills.title,
                      style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w900),
                    ).gradient(),
                    const SizedBox(height: 20),
                    const SkillsSection(isCompact: true),
                  ],
                ),
              ),
              const SizedBox(height: sectionSpace),
              // Build & Support Section
              Container(
                decoration: const BoxDecoration(color: AppColors.richBlack),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(contentPadding),
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: AppColors.lightPeriwinkle)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            t.strings.home.build.title,
                            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, height: 1.3),
                          ).gradient(),
                          const SizedBox(height: 16),
                          Text(
                            t.strings.home.build.description,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: PrimaryButton(label: t.strings.home.build.button, onTap: () {}),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(contentPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Text(
                            t.strings.home.support.title,
                            style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900, height: 1.3),
                          ).gradient(),
                          const SizedBox(height: 16),
                          Text(
                            t.strings.home.support.description,
                            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 30),
                          SizedBox(
                            width: double.infinity,
                            child: PrimaryButton(label: t.strings.home.support.button, onTap: () {}),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: sectionSpace),
              // Over the years section
              Container(
                width: double.infinity,
                decoration: const BoxDecoration(color: AppColors.richBlack),
                padding: const EdgeInsets.symmetric(vertical: 60, horizontal: contentPadding),
                child: Column(
                  children: [
                    Text(
                      t.strings.home.experience.title,
                      style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                    ).gradient(),
                    Text(
                      t.strings.home.experience.emoji,
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.8),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      t.strings.home.experience.description,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.8),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: sectionSpace),
              // Projects Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: contentPadding),
                child: Column(
                  children: ProjectData.projects
                      .map(
                        (project) => Padding(
                          padding: const EdgeInsets.only(bottom: 24),
                          child: ProjectBloc(project: project),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: sectionSpace),
              // Thank you section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: contentPadding),
                child: Column(
                  children: [
                    Text(
                      t.strings.home.thankYou.message,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, height: 1.6),
                    ),
                    const SizedBox(height: 30),
                    Text(
                      t.strings.home.thankYou.title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w900, height: 1.3),
                    ).gradient(),
                  ],
                ),
              ),
              const SizedBox(height: sectionSpace),
              // Connect section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: contentPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      t.strings.contact.title,
                      style: const TextStyle(fontSize: 16, color: AppColors.lightPeriwinkle),
                    ),
                    const SizedBox(height: 20),
                    TextLink(text: t.strings.contact.email, link: t.strings.links.email),
                    const SizedBox(height: 30),
                    TextLink(text: t.strings.contact.works, link: t.strings.links.email),
                    const SizedBox(height: 16),
                    TextLink(text: t.strings.contact.shelf, link: t.strings.links.github),
                    const SizedBox(height: 16),
                    TextLink(text: t.strings.contact.resume, link: t.strings.links.github),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              // Footer
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: contentPadding),
                child: Column(
                  children: [
                    Container(height: 1, width: double.infinity, color: AppColors.lightPeriwinkle),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          t.strings.footer.copyright,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            height: 1.6,
                            color: Colors.white,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        ImageLink(imageSvg: t.images.github, link: t.strings.links.github),
                        const SizedBox(width: 16),
                        ImageLink(imageSvg: t.images.linkedin, link: t.strings.links.linkedin),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Center(child: ViewerCounterWidget(fontSize: 12)),
                  ],
                ),
              ),
              const SizedBox(height: sectionSpace),
            ],
          ),
        ),
      );
    }); // Close Obx
  }
}
