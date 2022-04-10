import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../lessons_model.dart';

class LessonsProvider extends GetConnect {
  Future<Lessons?> getLessons({required int? subjectId}) async {
    try {
      await EasyLoading.show(status: 'إشارة خضراء');
      final res = await get(
        "https://dev.arifelearning.com/user/Lessons?subjectId=$subjectId",
      );
      EasyLoading.dismiss();
      if (res.status.hasError) {
        return Future.error(res.status);
      } else {
        return Lessons.fromJson(res.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
