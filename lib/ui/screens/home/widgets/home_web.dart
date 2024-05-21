import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hai_portfolio/data/model/project.dart';
import 'package:hai_portfolio/ui/common/primary_button.dart';
import 'package:hai_portfolio/ui/common/project_bloc.dart';
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
                              'I like to craft solid and scalable frontend products \nwith great user experiences.',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, height: 1.8),
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
                                    'Over a two years of experience building products for clients across africa.',
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
                          'Design',
                          style: TextStyle(
                            fontSize: 60,
                            fontWeight: FontWeight.w900,
                          ),
                        ).gradient(),
                        SizedBox(height: 20.h),
                        const Text(
                          "I design, even though I'm probably not the typical designer sitting in front of an Illustrator artboard tweaking pixels. You can always find me buried in stylesheets, fiddling with font sizes and thinking about layouts (~_^). Creating fluid user experiences is something I'm committed to doing while looking chic.",
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
                          "I have the ideal tools for developing JavaScript applications, and I can definitely work without them to produce quick, durable solutions that are designed for growth – performance and scalability are top objectives on my radar.",
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
                            "Open source\nprojects, web apps\nand experimentals.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 80.h),
                          SizedBox(
                            width: 400.w,
                            child: PrimaryButton(label: "Read My Article", onTap: () {}),
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
                      decoration: const BoxDecoration(color: AppColors.richBlack),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'I write,\nsometimes',
                            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900, height: 1.3),
                          ).gradient(),
                          SizedBox(height: 20.h),
                          const Text(
                            "Open source\nprojects, web apps\nand experimentals.",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 80.h),
                          SizedBox(
                            width: 400.w,
                            child: PrimaryButton(label: "Read My Article", onTap: () {}),
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
                      "I've built products for companies and individuals around africa ranging from marketing websites to complex solutions and enterprise apps with focus on fast, elegant and accessible user experiences. Currently, I work at Diool as a frontend engineer in the growth team.\n\n    Before now, I worked as the Founding Frontend Engineer at Klas, crafting thoughtful and inclusive experiences that adhere to web standards. Prior to Klas, I was a front engineer contractor with Regnify and Haxell, building digital products that users love",
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
                    width: 500.w,
                    child: const Text(
                      "Creating Mobile Solutions That Not Only Meet But Exceed Your Expectations",
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
                    style: TextStyle(fontSize: 60, fontWeight: FontWeight.w900, height: 1.3),
                  ).gradient(),
                ],
              ),
            ),
            SizedBox(height: sectionSpace),
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
                  Row(
                    children: [
                      const Text(
                        "© HAI 2024",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          height: 1.6,
                          color: Colors.white,
                        ),
                      ),
                      const Expanded(child: SizedBox()),
                      SvgPicture.asset(
                        "assets/images/github.svg",
                        height: 25,
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                      const SizedBox(width: 30),
                      SvgPicture.asset(
                        "assets/images/linkedin.svg",
                        height: 25,
                        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
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
