import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hai_portfolio/ui/theme/app_colors.dart';
import 'package:hai_portfolio/ui/theme/app_text_styles.dart';

class HomeWeb extends StatefulWidget {
  const HomeWeb({super.key});

  @override
  State<HomeWeb> createState() => _HomeWebState();
}

class _HomeWebState extends State<HomeWeb> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 200.w),
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
              padding: EdgeInsets.symmetric(horizontal: 200.w),
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
                              ),
                            ).gradient(),
                            SizedBox(height: 20.h),
                            const Text(
                              'I like to craft solid and scalable frontend products \nwith great user experiences.',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
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
          ],
        ),
      ),
    );
  }
}
