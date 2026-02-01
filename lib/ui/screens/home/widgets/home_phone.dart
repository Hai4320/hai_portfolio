import 'package:flutter/material.dart';
import 'package:hai_portfolio/data/model/project.dart';
import 'package:hai_portfolio/ui/common/image_link.dart';
import 'package:hai_portfolio/ui/common/primary_button.dart';
import 'package:hai_portfolio/ui/common/project_bloc.dart';
import 'package:hai_portfolio/ui/common/text_link.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/utils/gradient_text.dart';

class HomePhone extends StatefulWidget {
  const HomePhone({super.key});

  @override
  State<HomePhone> createState() => _HomePhoneState();
}

class _HomePhoneState extends State<HomePhone> {
  @override
  Widget build(BuildContext context) {
    const contentPadding = 24.0;
    const sectionSpace = 60.0;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: contentPadding),
              child: Row(
                children: [
                  Text(
                    'Hai.',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 40),
            // Hero Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: contentPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/avatar.jpg',
                      width: MediaQuery.of(context).size.width * 0.7,
                    ),
                  ),
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
                  const Text(
                    'Mobile\nDeveloper',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      height: 1.3,
                    ),
                  ).gradient(),
                  const SizedBox(height: 20),
                  const Text(
                    'I like to craft innovative and scalable mobile products with great user experiences.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Highly skilled at progressive enhancement, design systems & UI Engineering.',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      height: 1.8,
                    ),
                  ).gradient(),
                  const SizedBox(height: 20),
                  const Text(
                    'Over a two years of experience building products for clients across Japan and Vietnam.',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w200,
                      height: 1.8,
                    ),
                  ).gradient(),
                ],
              ),
            ),
            SizedBox(height: sectionSpace),
            // Skills Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: contentPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Mobile',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ).gradient(),
                  const SizedBox(height: 16),
                  const Text(
                    "I have the ideal tools for developing mobile applications, and I can definitely work without them to produce quick, durable solutions that are designed for growth – performance and scalability are top objectives on my radar.",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      height: 1.8,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    'Engineering',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                    ),
                  ).gradient(),
                  const SizedBox(height: 16),
                  const Text(
                    "Besides mobile development, I also enjoy working on web projects, sometimes as a Frontend developer and occasionally as a Backend developer. Although I'm not an expert in this field, I am very passionate about it.",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      height: 1.8,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: sectionSpace),
            // Build & Support Section
            Container(
              decoration: const BoxDecoration(
                color: AppColors.richBlack,
              ),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(contentPadding),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: AppColors.lightPeriwinkle),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'I build &\ndesign stuff',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                          ),
                        ).gradient(),
                        const SizedBox(height: 16),
                        const Text(
                          "Open source projects, mobile apps and experimentals.",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(label: "See my apps", onTap: () {}),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(contentPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        const Text(
                          'I support,\nsometimes',
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w900,
                            height: 1.3,
                          ),
                        ).gradient(),
                        const SizedBox(height: 16),
                        const Text(
                          "Report issue & bug open source",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(label: "Read My Article", onTap: () {}),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: sectionSpace),
            // Over the years section
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: AppColors.richBlack,
              ),
              padding: EdgeInsets.symmetric(
                vertical: 60,
                horizontal: contentPadding,
              ),
              child: Column(
                children: [
                  const Text(
                    'Over the years,',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                    ),
                  ).gradient(),
                  const Text(
                    "\n(~_^)\n",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      height: 1.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const Text(
                    "I build applications for both companies and personal projects, ranging from travel and food apps with a focus on user interface to AI applications for fitness and health with complex effects and logic, serving people all over Japan. Currently, I work at Sun* as a mobile engineer in the growth team.",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            SizedBox(height: sectionSpace),
            // Projects Section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: contentPadding),
              child: Column(
                children: [
                  ...List.generate(
                    6,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 24),
                      child: ProjectBloc(
                        project: Project(
                          name: "Maurice.Design",
                          tech: ["Android", "Firebase"],
                          description: 'App food',
                          link: 'https://www.google.com/',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: sectionSpace),
            // Thank you section
            Padding(
              padding: EdgeInsets.symmetric(horizontal: contentPadding),
              child: Column(
                children: [
                  const Text(
                    "Creating Mobile Solutions That Not Only Meet But Exceed Your Expectations.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Thank for your watching!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w900,
                      height: 1.3,
                    ),
                  ).gradient(),
                ],
              ),
            ),
            const SizedBox(height: sectionSpace),
            // Connect section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: contentPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "CONNECT ME",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.lightPeriwinkle,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextLink(
                    text: "duchai4320@gmai.com",
                    link: "mailto:duchai4320@gmai.com",
                  ),
                  SizedBox(height: 30),
                  TextLink(
                    text: "My Works",
                    link: "mailto:duchai4320@gmai.com",
                  ),
                  SizedBox(height: 16),
                  TextLink(
                    text: "My Shelf",
                    link: "https://github.com/Hai4320",
                  ),
                  SizedBox(height: 16),
                  TextLink(
                    text: "My Résumé",
                    link: "https://github.com/Hai4320",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            // Footer
            Padding(
              padding: EdgeInsets.symmetric(horizontal: contentPadding),
              child: Column(
                children: [
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: AppColors.lightPeriwinkle,
                  ),
                  const SizedBox(height: 20),
                  const Row(
                    children: [
                      Text(
                        "© HAI 2024.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
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
                      SizedBox(width: 16),
                      ImageLink(
                        imageSvg: "assets/images/linkedin.svg",
                        link: "https://github.com/Hai4320",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: sectionSpace),
          ],
        ),
      ),
    );
  }
}