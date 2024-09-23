import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_shop/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      this.onTap,
      this.color,
      this.btnWidth,
      this.btnHeight,
      this.radius, required this.text});

  final void Function()? onTap;
  final Color? color;
  final double? btnWidth;
  final double? btnHeight;
  final double? radius;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: btnWidth ?? width,
        height: btnHeight ?? 28.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 9.r),
          color: color ?? kPrimary,
        ),
        child: Center(
          child: Text(text,style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: CupertinoColors.white
          ),),
        ),
      ),
    );
  }
}
