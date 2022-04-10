import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../login_model.dart';

class LoginProvider extends GetConnect {
  Future<Login> postLogin(Map data) async {
    try {
      await EasyLoading.show(status: 'انتظر لحطة..');
      final res = await post("https://dev.arifelearning.com/user/Login", data);
      EasyLoading.dismiss();
      if (res.status.hasError) {
        return Future.error(res.status);
      } else {
        return Login.fromJson(res.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
