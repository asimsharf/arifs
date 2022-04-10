import 'package:get/get.dart';

import '../controllers/test_view_controller.dart';

class TestViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestViewController>(
      () => TestViewController(),
    );
  }
}
