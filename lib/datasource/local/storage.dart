import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:s7_cinema/const/app_key.dart';
import 'package:s7_cinema/models/response/login_response/login_response.dart';

class BaseBox {
  static final box = GetStorage('base');

  BaseBox._();

  static BaseBox instance = BaseBox._();

  static setToken(String value) {
    box.write(AppKeys.token, value);
  }

  static String getToken() {
    return box.read(AppKeys.token) ?? '';
  }

  static void setUserData(LoginResponse user) {
    box.write(AppKeys.userData, jsonEncode(user.toString()));
  }

  static LoginResponse? getUserData() {
    final data = box.read(AppKeys.userData);
    if (data != null) {
      return LoginResponse.fromJson(
        jsonDecode(data),
        (json) => json as dynamic,
      );
    }
    return null;
  }
}
