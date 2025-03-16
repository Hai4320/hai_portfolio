import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hai_portfolio/data/model/project.dart';
import 'package:hai_portfolio/ui/common/image_link.dart';
import 'package:hai_portfolio/ui/common/primary_button.dart';
import 'package:hai_portfolio/ui/common/project_bloc.dart';
import 'package:hai_portfolio/ui/common/text_link.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/utils/gradient_text.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({super.key});

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  @override
  Widget build(BuildContext context) {
    final contentPadding = 200.w;
    final sectionSpace = 140.h;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: contentPadding),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Hai.',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )
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
                            const Text(
                              'Mobile\nDeveloper',
                              style: TextStyle(
                                fontSize: 60,
                                fontWeight: FontWeight.w900,
                                height: 1.3,
                              ),
                            ).gradient(),
                            SizedBox(height: 40.h),
                            const Text(
                              'I like to craft innovative and scalable mobile products\nwith great user experiences.',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w300,
                                  height: 1.8),
                            ),
                            SizedBox(height: 100.h),
                            Row(
                              children: [
                                Expanded(
                                  child: const Text(
                                    'Highly skilled at progressive enhancement, design systems & UI Engineering.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w200,
                                      height: 1.8,
                                    ),
                                  ).gradient(),
                                ),
                                SizedBox(width: 120.w),
                                Expanded(
                                  child: const Text(
                                    'Over a two years of experience building products for clients across Japan and Vietnam.',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w200,
                                      height: 1.8,
                                    ),
                                  ).gradient(),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      const Expanded(child: SizedBox.shrink()),
                      Column(
                        children: [
                          Image.asset(
                            'assets/images/avatar.jpg',
                            width: 450.w,
                          ),
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
                          )
                        ],
                      )
                    ],
                  )
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
                        const Text(
                          'Mobile',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w900,
                          ),
                        ).gradient(),
                        SizedBox(height: 20.h),
                        const Text(
                          "I have the ideal tools for developing mobile applications, and I can definitely work without them to produce quick, durable solutions that are designed for growth – performance and scalability are top objectives on my radar.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            height: 1.8,
                          ),
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
                        const Text(
                          'Engineering',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w900,
                          ),
                        ).gradient(),
                        SizedBox(height: 20.h),
                        const Text(
                          "Besides mobile development, I also enjoy working on web projects, sometimes as a Frontend developer and occasionally as a Backend developer. Although I'm not an expert in this field, I am very passionate about it.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            height: 1.8,
                          ),
                        ),
                      ],
                    ),
                  ),
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
                        border: Border(
                          right: BorderSide(color: AppColors.lightPeriwinkle),
                        ),
                      ),
                      padding: EdgeInsets.only(
                        top: 140.h,
                        bottom: 140.h,
                        left: 120.w,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'I build &\ndesign stuff',
                            style: TextStyle(
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                              height: 1.3,
                            ),
                          ).gradient(),
                          SizedBox(height: 20.h),
                          const Text(
                            "Open source\nprojects, mobile apps\nand experimentals.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 80.h),
                          SizedBox(
                            width: 400.w,
                            child: PrimaryButton(
                                label: "See my apps", onTap: () {}),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                        top: 140.h,
                        bottom: 140.h,
                        left: 120.w,
                      ),
                      decoration:
                          const BoxDecoration(color: AppColors.richBlack),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'I support,\nsometimes',
                            style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.w900,
                                height: 1.3),
                          ).gradient(),
                          SizedBox(height: 20.h),
                          const Text(
                            "Report\nissue & bug\nopen source",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 80.h),
                          SizedBox(
                            width: 400.w,
                            child: PrimaryButton(
                                label: "Read My Article", onTap: () {}),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: sectionSpace),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.richBlack,
              ),
              padding: EdgeInsets.symmetric(vertical: 160.h),
              child: Column(
                children: [
                  const Text(
                    'Over the years,',
                    style: TextStyle(
                      fontSize: 56,
                      fontWeight: FontWeight.w900,
                    ),
                  ).gradient(),
                  const Text(
                    "\n(~_^)\n",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    width: 700,
                    child: Text(
                      "I build applications for both companies and personal projects, ranging from travel and food apps with a focus on user interface to AI applications for fitness and health with complex effects and logic, serving people all over Japan. Currently, I work at Sun* as a mobile engineer in the growth team.",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        height: 1.8,
                      ),
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
                children: [
                  ...List.generate(
                    6,
                    (index) => ProjectBloc(
                      project: Project(
                        name: "Maurice.Design",
                        tech: ["Android", "Firebase"],
                        description: 'App food',
                        link: 'https://www.google.com/',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: sectionSpace),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 200.w),
              child: Column(
                children: [
                  SizedBox(
                    width: 600.w,
                    child: const Text(
                      "Creating Mobile Solutions That Not Only Meet But Exceed Your Expectations.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        height: 1.6,
                      ),
                    ),
                  ),
                  SizedBox(height: 50.h),
                  const Text(
                    'Thank for your watching!',
                    style: TextStyle(
                        fontSize: 60, fontWeight: FontWeight.w900, height: 1.3),
                  ).gradient(),
                ],
              ),
            ),
            SizedBox(height: sectionSpace),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: contentPadding),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "CONNECT ME",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.lightPeriwinkle,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: contentPadding),
              child: const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      TextLink(
                        text: "duchai4320@gmai.com",
                        link: "mailto:duchai4320@gmai.com",
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                  SizedBox(width: 150),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextLink(
                        text: "My Works",
                        link: "mailto:duchai4320@gmai.com",
                      ),
                      SizedBox(height: 20),
                      TextLink(
                        text: "My Shelf",
                        link: "https://github.com/Hai4320",
                      ),
                      SizedBox(height: 20),
                      TextLink(
                        text: "My Résumé",
                        link: "https://github.com/Hai4320",
                      ),
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
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColors.lightPeriwinkle,
                  ),
                  SizedBox(height: 30.h),
                  const Row(
                    children: [
                      Text(
                        "© HAI 2024.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          height: 1.6,
                          color: Colors.white,
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      ImageLink(
                        imageSvg: "assets/images/github.svg",
                        link: "https://github.com/Hai4320",
                      ),
                      SizedBox(width: 20),
                      ImageLink(
                        imageSvg: "assets/images/linkedin.svg",
                        link: "https://www.linkedin.com/in/duc-hai-362004265/",
                      ),
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
  }
}
