import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:multi_shop/constants/constants.dart';

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kLightWhite,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: IconButton(
                onPressed: () {},
                icon: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/usa.svg",
                      width: 15.w,
                      height: 25.h,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Container(
                      width: 1.w,
                      height: 15.h,
                      color: kLightWhite,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "USA",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 4.h),
                      child: Icon(
                        SimpleLineIcons.settings,
                        size: 18.h,
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
