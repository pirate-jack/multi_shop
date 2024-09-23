import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_shop/common/reusable_text.dart';
import 'package:multi_shop/constants/constants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 110.h,
      width: width,
      color: kOffWhite,
      child: Container(
        margin: EdgeInsets.only(top: 20.h, left: 7.w, right: 7.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundColor: kPrimary,
                  backgroundImage:AssetImage('assets/foodly/Pizza.png'),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 6.h, left: 8.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText('Deliver to', 15, kPrimary, FontWeight.w600),
                  SizedBox(
                    width: width * 0.65,
                    child: Text(
                      '173 Navagam Dindoli , Surat 394210 ',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12, color: kPrimary),
                    ),
                  )
                ],
              ),
            ),
            Text(
              getTimeOfToday(),
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  String getTimeOfToday(){
DateTime now = DateTime.now();
int hours = now.hour;
if(hours >= 0 && hours < 12){
  return " 🌞 ";
}else if(hours >= 12 && hours < 16){
  return " 🌤️ ";
}else{
  return " 🌙 ";
}

  }

}
