import 'dart:convert';

import 'package:arif/app/modules/login/login_model.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../levels_model.dart';
import '../providers/home_provider.dart';
import '../subjects_model.dart';

class HomeController extends GetxController {
  final gStorage = GetStorage();
  late DataLogin object;
  var isProcessing = true.obs;
  DataLogin get getObject => object;

  @override
  void onInit() {
    readUserLogin();
    levels(schoolId: getObject.schoolId);

    super.onInit();
  }

  logOut() async {
    await EasyLoading.show(status: 'انتظر لحطة..');
    gStorage.remove('LOGIN_MODEL');
    EasyLoading.dismiss();
    Future.delayed(const Duration(seconds: 2)).then((_) {
      Get.offAllNamed(Routes.LOGIN);
    });
    update();
  }

  readUserLogin() {
    if (gStorage.hasData('LOGIN_MODEL')) {
      var jsonString = gStorage.read('LOGIN_MODEL');
      final loginModel = loginModelFromJson(jsonEncode(jsonString));
      object = loginModel;
    }
  }

  var listsLevels = List<LevelsData>.empty(growable: true).obs;

  void levels({required int? schoolId}) {
    HomeProvider().getLevels(schoolId: schoolId).then(
      (res) {
        isProcessing(false);
        if (res!.code == 1) {
          listsLevels.clear();
          for (var e in res.data!) {
            listsLevels.add(e);
          }
          subjects(levelId: listsLevels.first.id);
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

  var listsSubjects = List<SubjectsData>.empty(growable: true).obs;

  void subjects({required int? levelId}) {
    HomeProvider().getSubjects(levelId: levelId).then(
      (res) {
        isProcessing(false);
        if (res!.code == 1) {
          listsSubjects.clear();
          for (var e in res.data!) {
            listsSubjects.add(e);
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
