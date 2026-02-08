import 'package:get/get.dart';
import 'package:hai_portfolio/data/repository/viewer_repository.dart';

class ViewerController extends GetxController {
  final ViewerRepository _repository = ViewerRepository();

  final RxInt viewerCount = 0.obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _initViewerCount();
  }

  Future<void> _initViewerCount() async {
    try {
      // Every visit counts - increment counter each time user visits
      viewerCount.value = await _repository.incrementViewerCount();
    } catch (e) {
      viewerCount.value = 0;
    } finally {
      isLoading.value = false;
    }
  }

  /// Subscribe to real-time updates
  void listenToViewerCount() {
    _repository.streamViewerCount().listen((count) {
      viewerCount.value = count;
    });
  }

  /// Force refresh viewer count
  Future<void> refreshViewerCount() async {
    isLoading.value = true;
    viewerCount.value = await _repository.getViewerCount();
    isLoading.value = false;
  }
}
