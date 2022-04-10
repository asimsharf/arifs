import 'package:get/get.dart';

import '../controllers/media_play_list_controller.dart';

class MediaPlayListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MediaPlayListController>(
      () => MediaPlayListController(),
    );
  }
}
