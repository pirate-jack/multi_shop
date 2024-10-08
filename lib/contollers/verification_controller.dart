import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/models/api_error.dart';
import 'package:multi_shop/models/login_response.dart';
import 'package:multi_shop/view/entry_point.dart';

class VerificationController extends GetxController {
  final box = GetStorage();

  String _code = "";

  String get code => _code;

  set setCode(String value) {
    _code = value.trim();
  }

  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void verificationFunction() async {
    setLoading = true;
    String accessToken = box.read("token") ?? "";
    debugPrint("Verification code: $_code");
    debugPrint("Verification Token: $accessToken");

    if (_code.isEmpty) {
      Get.snackbar("Error", "Please enter a valid verification code.",
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: Icon(MaterialIcons.error_outline));
      setLoading = false;
      return;
    }

    Uri url = Uri.parse("$appBaseUrl/api/users/verify/$_code");
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    };

    try {
      var response = await http.get(url, headers: headers);
      if (response.statusCode == 200) {
        debugPrint("Response status: ${response.statusCode}");
        LoginResponse data = loginResponseFromJson(response.body);
        print("Response body: ${data}");
        String userId = data.id;
        String userData = jsonEncode(data);
        box.write(userId, userData);
        box.write("token", data.userToken);
        box.write("userId", data.id);
        box.write("verification", data.verification);


        Get.snackbar("You are successfully Verified", "Done!",
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: Icon(Ionicons.fast_food_outline, color: kWhite));
        Get.off(() => MainScreen());
      } else if (response.statusCode == 404) {
        Get.snackbar("User Not Found", "No user exists with the provided code.",
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: Icon(MaterialIcons.error_outline));
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Verification failed", error.message,
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: Icon(MaterialIcons.error_outline));
      }
    } catch (e) {
      debugPrint("Caught an error: $e");
      Get.snackbar("Error", "An unexpected error occurred. Please try again.",
          colorText: kLightWhite,
          backgroundColor: kPrimary,
          icon: Icon(MaterialIcons.error_outline));
    } finally {
      setLoading = false;
    }
  }
}
