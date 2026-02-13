import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hai_portfolio/app.dart';
import 'package:hai_portfolio/data/service/link_analytics_service.dart';
import 'package:hai_portfolio/firebase_options.dart';
import 'package:hai_portfolio/i18n/strings.g.dart';
import 'package:hai_portfolio/ui/screens/home/viewer_controller.dart';
import 'package:hai_portfolio/utils/locale_controller.dart';

// Web-specific import
import 'package:web/web.dart' as web;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await ScreenUtil.ensureScreenSize();

  // Initialize Controllers & Services
  Get.put(LocaleController());
  Get.put(ViewerController());
  Get.put(LinkAnalyticsService());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(TranslationProvider(child: const MyApp()));

  // Remove loading screen after Flutter app is ready (web only)
  if (kIsWeb) {
    _removeLoadingScreen();
  }
}

void _removeLoadingScreen() {
  try {
    final loadingElement = web.document.getElementById('loading');
    if (loadingElement != null) {
      loadingElement.classList.add('fade-out');
      Future.delayed(const Duration(milliseconds: 800), () {
        loadingElement.remove();
      });
    }
  } catch (e) {
    debugPrint('Error removing loading screen: $e');
  }
}
