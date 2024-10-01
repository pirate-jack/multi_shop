import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_shop/common/custom_container.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/login_controller.dart';
import 'package:multi_shop/models/login_response.dart';
import 'package:multi_shop/view/auth/login_page.dart';
import 'package:multi_shop/view/auth/verification_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    final box = GetStorage();
    LoginResponse? user;
    String? token = box.read("token");
    if (token != null) {
      user = controller.getUserInfo();
    }
    if (token == null) {
      return LoginPage();
    }
    if (user!.verification == false) {
      return VerificationPage();
    }
    return Scaffold(
      backgroundColor: kWhite,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: Container(
          height: 130,
        ),
      ),
      body: CustomContainer(containerContent: Container(),),
    );
  }
}
