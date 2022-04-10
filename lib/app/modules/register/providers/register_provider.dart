import 'package:get/get.dart';

import '../register_model.dart';

class RegisterProvider extends GetConnect {
  String url = "https://dev.arifelearning.com/user/Register";
  Future<Register> postRegister(Map data) async {
    try {
      final res = await post(url, data);
      if (res.status.hasError) {
        return Future.error(res.status);
      } else {
        return Register.fromJson(res.body);
      }
    } catch (exception) {
      return Future.error(exception.toString());
    }
  }
}
