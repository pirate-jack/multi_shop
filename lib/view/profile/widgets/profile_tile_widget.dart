import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:multi_shop/constants/constants.dart';

class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget(
      {super.key, required this.title, required this.icon, this.onTap});

  final String title;
  final IconData icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      visualDensity: VisualDensity.compact,
      onTap: onTap,
      leading: Icon(icon,size: 20.h,),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: kGray,
        ),
      ),
      trailing: title != "Settings"
          ? Icon(AntDesign.right,size: 20.h,)
          : SvgPicture.asset(
              "assets/icons/usa.svg",
              width: 15.w,
              height: 20.h,
            ),
    );
  }
}
