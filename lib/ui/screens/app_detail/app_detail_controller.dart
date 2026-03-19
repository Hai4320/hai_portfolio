import 'package:get/get.dart';
import 'package:hai_portfolio/data/model/app.dart';
import 'package:hai_portfolio/data/repository/app_data.dart';

class AppDetailController extends GetxController {
  late App app;
  final currentScreenshotIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    final appId = Get.parameters['appId'];
    _loadApp(appId ?? '');
  }

  void _loadApp(String appId) {
    final loadedApp = AppData.getAppById(appId);
    if (loadedApp != null) {
      app = loadedApp;
    } else {
      // Fallback to first app if not found
      app = AppData.apps.first;
    }
  }

  void setCurrentScreenshot(int index) {
    currentScreenshotIndex.value = index;
  }
}
