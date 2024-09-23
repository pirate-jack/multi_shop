import 'package:flutter/cupertino.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/models/api_error.dart';
import 'package:multi_shop/models/success_model.dart';
import 'package:multi_shop/view/auth/verification_page.dart';

class RegistrationController extends GetxController {
  RxBool _isLoading = false.obs;
  final box = GetStorage();

  bool get isLoading => _isLoading.value;

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void registrationFunction(String data) async {
    setLoading = true;

    Uri url = Uri.parse("$appBaseUrl/register");
    Map<String, String> headers = {'Content-type': 'application/json'};
    try {
      var response = await http.post(url, headers: headers, body: data);
      if (response.statusCode == 201) {
        print(response.statusCode);
        var data = successModelFromJson(response.body);

        setLoading = false;
        Get.to(() => VerificationPage());
        Get.snackbar("You are successfully Register!", "Done!",
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: Icon(Ionicons.fast_food_outline));
      } else {
        var error = apiErrorFromJson(response.body);
        Get.snackbar("Registration failed", error.toString(),
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: Icon(MaterialIcons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
