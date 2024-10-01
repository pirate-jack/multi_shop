import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/phone_verification_controller.dart';
import 'package:phone_otp_verification/phone_verification.dart';

class PhoneVerificationPage extends StatelessWidget {
  const PhoneVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PhoneVerificationController());
    return PhoneVerification(
      isFirstPage: false,
      enableLogo: false,
      themeColor: kPrimary,
      backgroundColor: kLightWhite,
      initialPageText: "Verify Phone Number",
      initialPageTextStyle: const TextStyle(
        color: kPrimary,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      textColor: kDark,
      onSend: (String value) {
        print('Phone number: $value');
        controller.setPhone = value;
        // controller.verifyPhone();
      },
      onVerification: (String value) {
        print('OTP: $value');
      },
    );
  }
}
