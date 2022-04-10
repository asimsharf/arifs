import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../providers/login_provider.dart';

class LoginController extends GetxController {
  var isProcessing = false.obs;
  final gStorage = GetStorage();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  void login() {
    try {
      Map data = {"name": "std1@mail.com", "pass": "123"};
      isProcessing(true);
      LoginProvider().postLogin(data).then(
        (res) {
          if (res.code == 1) {
            gStorage.write('LOGIN_MODEL', res.data);
            isProcessing(false);
            Get.snackbar(
              "Success",
              "User ${res.data?.name} Successfully login!",
            );
            Get.offAllNamed(Routes.HOME);
          } else {
            Get.snackbar(
              "Error",
              "Username or password incorrect!",
            );
          }
        },
        onError: (err) {
          isProcessing(false);
        },
      );
    } catch (exception) {
      isProcessing(false);
    }
    update();
  }

  bool isAuth() {
    if (gStorage.hasData('LOGIN_MODEL')) {
      return true;
    } else {
      return false;
    }
  }

  logOut() async {
    await EasyLoading.show(status: 'انتظر لحطة..');
    gStorage.remove('LOGIN_MODEL');
    Future.delayed(const Duration(seconds: 1)).then((_) {
      Get.offAllNamed(Routes.LOGIN);
    });
    EasyLoading.dismiss();
    update();
  }
}
