import 'package:arif/app/modules/register/providers/register_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

class RegisterController extends GetxController {
  var isProcessing = false.obs;

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void login() {
    try {
      Map data = {
        "name": "moh ali ahmed",
        "pass": "123",
        "email": "std1@mail.com",
        "phone": "123",
      };
      isProcessing(true);
      RegisterProvider().postRegister(data).then((res) {
        if (res.code == 1) {
          isProcessing(false);
          Get.snackbar(
            "Success",
            "User ${res.data?.name} Successfully registered!",
          );
          Get.offAllNamed(Routes.LOGIN);
        } else {
          Get.snackbar(
            "Error",
            "Username or password incorrect!",
          );
        }
      }, onError: (err) {
        isProcessing(false);
      });
    } catch (exception) {
      isProcessing(false);
    }
  }
}
