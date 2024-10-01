import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_shop/constants/constants.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer({super.key, required this.containerContent, this.color});

  Widget containerContent;
  Color? color;
@override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.74,
      width: width,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(32.r),
          bottomLeft: Radius.circular(32.r),
        ),
        child: Container(
          width: width,
          color: color ?? kOffWhite,
          child: SingleChildScrollView(
            child: containerContent,
          ),
        ),
      ),
    );
  }
}
