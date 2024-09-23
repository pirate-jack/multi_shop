import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_shop/constants/constants.dart';

class BackgroundContainer extends StatelessWidget {
  final Widget child;
  final Color color;



  BackgroundContainer({required this.child, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r)),
        image: DecorationImage(
            image: AssetImage('assets/images/restaurant_bk.png'),
            fit: BoxFit.cover,
            opacity: 0.7),
      ),
      child: child,
    );
  }
}
