import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:multi_shop/models/login_response.dart';

class VerificationController extends GetxController {
  RxBool _isLoading = false.obs;
  final box = GetStorage();

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void verificationFunction(String code) async {
    setLoading = true;

    Uri url = Uri.parse("$appBaseUrl/api/users/verify/");
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
}
