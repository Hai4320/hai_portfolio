import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/app.dart';
import 'package:hai_portfolio/firebase_options.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/screens/home/viewer_controller.dart';
import 'package:hai_portfolio/utils/locale_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await ScreenUtil.ensureScreenSize();

  // Initialize Controllers
  Get.put(LocaleController());
  Get.put(ViewerController());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(TranslationProvider(child: const MyApp()));
}
