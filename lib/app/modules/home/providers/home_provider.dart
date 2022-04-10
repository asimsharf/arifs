import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../levels_model.dart';
import '../subjects_model.dart';

class HomeProvider extends GetConnect {
  Future<Subjects?> getSubjects({required int? levelId}) async {
    try {
      await EasyLoading.show(status: 'إشارة خضراء');
      final res = await get(
        "https://dev.arifelearning.com/user/Subjects?levelId=$levelId",
      );
      EasyLoading.dismiss();
      if (res.status.hasError) {
        return Future.error(res.status);
      } else {
        return Subjects.fromJson(res.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }

  Future<Levels?> getLevels({required int? schoolId}) async {
    try {
      await EasyLoading.show(status: 'إشارة خضراء');
      final res = await get(
        "https://dev.arifelearning.com/user/Levels?schoolId=$schoolId",
      );
      EasyLoading.dismiss();
      if (res.status.hasError) {
        return Future.error(res.status);
      } else {
        return Levels.fromJson(res.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
