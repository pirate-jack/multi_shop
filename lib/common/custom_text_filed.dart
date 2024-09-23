import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_shop/constants/constants.dart';

class CustomTextWidget extends StatelessWidget {
   CustomTextWidget({super.key,  this.keyboardType, required this.controller, this.onEditingComplete, this.obscureText, this.suffixIcon, this.validator, this.prefixIcon, this.hintText, this.maxLines});

  final TextInputType? keyboardType;
  final TextEditingController controller;
  final void Function()? onEditingComplete;
  final bool? obscureText;
  final int? maxLines;
  final String? hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {

    return Container(

      margin: EdgeInsets.all(6.h),
      padding: EdgeInsets.only(left: 8.h),
      decoration: BoxDecoration(
        border: Border.all(color: kGray,width: 0.4),
        borderRadius: BorderRadius.circular(9.r),
      ),
      child: TextFormField(
        maxLines: maxLines,
        keyboardType: keyboardType,
        controller: controller,
        onEditingComplete: onEditingComplete,
        obscureText: obscureText ?? false,
        cursorHeight: 15,
        style:  TextStyle(
          fontSize: 18,
          color: kDark,
        ),
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(
            fontSize: 18,
            color: kDark,
          ),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
          hintText: hintText,
        ),
      ),
    );
  }
}
