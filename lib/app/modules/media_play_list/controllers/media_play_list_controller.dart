import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../media_play_list_model.dart';
import '../providers/media_play_list_provider.dart';

class MediaPlayListController extends GetxController {
  var isProcessing = true.obs;
  final gStorage = GetStorage();

  var lists = List<MediaPlayListData>.empty(growable: true).obs;

  void mediaPlayList({required int? lessoneId}) {
    MediaPlayListProvider().getMediaPlayList(lessoneId: lessoneId).then(
      (res) {
        isProcessing(false);

        if (res!.code == 1) {
          lists.clear();
          for (var e in res.data!) {
            lists.add(e);
            Get.toNamed(Routes.MEDIA_PLAY_LIST);
          }
        } else {
          Get.snackbar(
            "Error",
            "Error fetch data from back-end",
          );
        }
      },
      onError: (err) {
        isProcessing(false);
      },
    );
    update();
  }
}
