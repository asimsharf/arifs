import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../lessons_model.dart';
import '../providers/lessons_provider.dart';

class LessonsController extends GetxController {
  var isProcessing = true.obs;
  final gStorage = GetStorage();

  var lists = List<LessonsData>.empty(growable: true).obs;

  void lessons({required int? subjectId}) {
    LessonsProvider().getLessons(subjectId: subjectId).then(
      (res) {
        isProcessing(false);
        if (res!.code == 1) {
          lists.clear();
          for (var e in res.data!) {
            lists.add(e);
            Get.toNamed(Routes.LESSONS);
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
