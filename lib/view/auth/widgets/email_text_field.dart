import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_shop/constants/constants.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField(
      {super.key,
      this.onEditingComplete,
      this.keyboardType,
      this.initialValue,
      this.controller,
      this.hintText,
      this.prefixIcon});

  final void Function()? onEditingComplete;
  final TextInputType? keyboardType;
  final String? initialValue;
  final TextEditingController? controller;
  final String? hintText;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onEditingComplete: onEditingComplete,
      keyboardType: keyboardType ?? TextInputType.emailAddress,
      initialValue: initialValue,
      controller: controller,
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
          hintText: hintText,
          prefixIcon: prefixIcon,
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
    );
  }
}
