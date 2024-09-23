import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/password_controller.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField({
    super.key,
    this.Pcontroller,
  });

  final TextEditingController? Pcontroller;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PasswordController());
    return Obx(() => TextFormField(
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.visiblePassword,
          controller: Pcontroller,
          obscureText: controller.password,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter valid data';
            } else {
              return null;
            }
          },
          style: TextStyle(
            fontSize: 12,
            color: kDark,
          ),
          decoration: InputDecoration(
              hintText: "Password",
              prefixIcon: Icon(
                CupertinoIcons.lock_circle,
                size: 20.h,
                color: kGrayLight,
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  controller.setPassword = !controller.password;
                },
                child: Icon(
                  controller.password
                      ? CupertinoIcons.eye_slash
                      : CupertinoIcons.eye,
                  size: 20.h,
                  color: kGrayLight,
                ),
              ),
              isDense: true,
              contentPadding: EdgeInsets.all(6.h),
              hintStyle: TextStyle(
                fontSize: 15,
                color: kGray,
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kRed, width: 0.5.w),
                borderRadius: BorderRadius.all(
                  Radius.circular(9.r),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimary, width: 0.5.w),
                borderRadius: BorderRadius.all(
                  Radius.circular(9.r),
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kRed, width: 0.5.w),
                borderRadius: BorderRadius.all(
                  Radius.circular(9.r),
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kGray, width: 0.5.w),
                borderRadius: BorderRadius.all(
                  Radius.circular(9.r),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimary, width: 0.5.w),
                borderRadius: BorderRadius.all(
                  Radius.circular(9.r),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimary, width: 0.5.w),
                borderRadius: BorderRadius.all(
                  Radius.circular(9.r),
                ),
              )),
        ));
  }
}
