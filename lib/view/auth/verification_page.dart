import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:multi_shop/common/custom_button.dart';
import 'package:multi_shop/common/custom_container.dart';
import 'package:multi_shop/constants/constants.dart';

class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: AppBar(
        backgroundColor: kOffWhite,
        title: const Text(
          'Please Verify Your Account',
          style: TextStyle(
            color: kGray,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: CustomContainer(
          containerContent: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: SizedBox(
          height: height,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Lottie.asset(
                "assets/anime/food1.json",
                width: width / 2,
                height: height / 4,
              ),
              Text(
                'Verify Your Account',
                style: TextStyle(
                  fontSize: 25,
                  color: kPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Enter the 6 Digit code sent to your email, if you don't see code check your spam folder.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 15,
                  color: kGray,
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: OtpTextField(
                  numberOfFields: 6,
                  borderColor: kPrimary,
                  borderWidth: 2,
                  textStyle: TextStyle(fontWeight: FontWeight.w600),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    print(verificationCode);
                  }, // end onSubmit
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(
                color: kPrimary,
                text: "V E R I F Y A C C O U N T",
                onTap: () {},
                btnHeight: 35.h,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
