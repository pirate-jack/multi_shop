import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/models/api_error.dart';
import 'package:multi_shop/models/login_response.dart';
import 'package:multi_shop/view/auth/verification_page.dart';
import 'package:multi_shop/view/entry_point.dart';

class LoginController extends GetxController {
  RxBool _isLoading = false.obs;
  final box = GetStorage();

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void loginFunction(String data) async {
    setLoading = true;

    Uri url = Uri.parse("$appBaseUrl/login");
    Map<String, String> headers = {'Content-type': 'application/json'};
    try {
      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 200) {
        LoginResponse data = loginResponseFromJson(response.body);
        String userId = data.id;
        String userData = jsonEncode(data);
        box.write(userId, userData);
        box.write("token", data.userToken);
        box.write("userId", data.id);
        box.write("verification", data.verification);

        setLoading = false;
        Get.snackbar("You are successfully Login", "Done!",
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: Icon(
              Ionicons.fast_food_outline,
              color: kWhite,
            ));

        if (data.verification == false) {
          Get.offAll(
            () => VerificationPage(),
            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 800),
          );
        }
        Get.offAll(
          () => MainScreen(),
          transition: Transition.fadeIn,
          duration: Duration(milliseconds: 800),
        );
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Login failed", error.toString(),
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: Icon(MaterialIcons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  LoginResponse? getUserInfo() {
    String? userId = box.read("userId");
    String? data;
    if (userId != null) {
      data = box.read(userId.toString());
    }
    if (data != null) {
      return loginResponseFromJson(data);
    }
    return null;
  }

  void logout() {
    box.erase();
    Get.offAll(
      () => MainScreen(),
      transition: Transition.fadeIn,
      duration: Duration(milliseconds: 800),
    );
    Get.snackbar(
      "Logout!",
      "Logout!",
      colorText: kLightWhite,
      backgroundColor: kPrimary,
      icon: Icon(
        AntDesign.logout,
        color: Colors.white,
      ),
    );
  }
}
