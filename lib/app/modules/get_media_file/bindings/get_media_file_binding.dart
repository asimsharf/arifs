import 'package:get/get.dart';

import '../controllers/get_media_file_controller.dart';

class GetMediaFileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GetMediaFileController>(
      () => GetMediaFileController(),
    );
  }
}
