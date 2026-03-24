import 'package:get/get.dart';
import 'package:hai_portfolio/data/model/app.dart';
import 'package:hai_portfolio/data/repository/app_data.dart';

class AppDetailController extends GetxController {
  App? _app;
  final currentScreenshotIndex = 0.obs;

  App get app => _app!;
  bool get hasApp => _app != null;

  @override
  void onInit() {
    super.onInit();
    final appId = Get.parameters['appId'];
    _app = AppData.getAppById(appId ?? '');
  }

  void setCurrentScreenshot(int index) {
    currentScreenshotIndex.value = index;
  }
}
