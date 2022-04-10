import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../media_play_list_model.dart';

class MediaPlayListProvider extends GetConnect {
  Future<MediaPlayList?> getMediaPlayList({required int? lessoneId}) async {
    try {
      await EasyLoading.show(status: 'إشارة خضراء');
      final res = await get(
        "https://dev.arifelearning.com/user/MediaPlayList?lessoneId=$lessoneId",
      );
      EasyLoading.dismiss();
      if (res.status.hasError) {
        return Future.error(res.status);
      } else {
        return MediaPlayList.fromJson(res.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
