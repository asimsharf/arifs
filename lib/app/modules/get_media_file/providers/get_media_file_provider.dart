import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../get_media_file_model.dart';

class GetMediaFileProvider extends GetConnect {
  Future<GetMediaFile?> getMediaFile(
      {required int? mediaFileId, required schoolId}) async {
    try {
      await EasyLoading.show(status: 'إشارة خضراء');
      final res = await get(
        "https://dev.arifelearning.com/user/GetMediaFile?mediaFileId=$mediaFileId&schoolId=$schoolId",
      );
      EasyLoading.dismiss();
      if (res.status.hasError) {
        return Future.error(res.status);
      } else {
        return GetMediaFile.fromJson(res.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
