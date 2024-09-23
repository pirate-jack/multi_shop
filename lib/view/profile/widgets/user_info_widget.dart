import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/models/login_response.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({super.key,  this.user});
  final LoginResponse? user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kLightWhite,
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 0, 16, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3.h, bottom: 3.h),
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimary,
                    ),
                    child: ClipOval(
                        // Clip to a circle shape
                        child: Image.network(
                      user!.profile,
                      fit: BoxFit.cover,
                    )),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user!.username,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        user!.email,
                        style: TextStyle(color: kGray),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Feather.edit,
                  color: kGray,
                  size: 18.h,
                ))
          ],
        ),
      ),
    );
  }
}
