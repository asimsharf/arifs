import 'package:get/get.dart';

import '../controllers/test_questions_controller.dart';

class TestQuestionsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TestQuestionsController>(
      () => TestQuestionsController(),
    );
  }
}
