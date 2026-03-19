import 'package:get/get.dart';
import 'package:hai_portfolio/data/model/app.dart';
import 'package:hai_portfolio/data/repository/app_data.dart';

class AppsController extends GetxController {
  final allApps = <App>[].obs;
  final filteredApps = <App>[].obs;
  final selectedFilter = 'all'.obs; // 'all' or 'featured'

  @override
  void onInit() {
    super.onInit();
    _loadApps();
  }

  void _loadApps() {
    allApps.value = AppData.apps;
    _applyFilter();
  }

  void setFilter(String filter) {
    selectedFilter.value = filter;
    _applyFilter();
  }

  void _applyFilter() {
    if (selectedFilter.value == 'featured') {
      filteredApps.value = allApps.where((app) => app.isFeatured).toList();
    } else {
      filteredApps.value = allApps;
    }
  }

  int getTotalApps() => allApps.length;
  int getFeaturedAppsCount() => allApps.where((app) => app.isFeatured).length;
}
