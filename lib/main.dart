import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/app.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/utils/locale_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();

  // Initialize LocaleController
  Get.put(LocaleController());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(TranslationProvider(child: const MyApp()));
}
