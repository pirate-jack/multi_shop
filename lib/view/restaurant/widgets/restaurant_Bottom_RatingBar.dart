import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_shop/common/custom_button.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/view/restaurant/rating_page.dart';
import 'package:multi_shop/view/restaurant/restaurant_page.dart';

class RestaurantBottomBar extends StatelessWidget {
  const RestaurantBottomBar({super.key, required this.widget});

  final RestaurantPage widget;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      height: 40.h,
      width: width,
      decoration: BoxDecoration(
        color: kPrimary.withOpacity(0.4),
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(8.r),
          topLeft: Radius.circular(8.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBarIndicator(
            itemCount: 5,
            itemSize: 25,
            rating: widget.restaurant!.rating,
            itemBuilder: (context, index) {
              return Icon(
                Icons.star,
                color: Colors.yellow,
              );
            },
          ),
          CustomButton(
            color: kSecondary,
            text: "Rate Restaurant",
            btnWidth: width / 3,
            onTap: () {
              Get.to(
                    () => RatingPage(),
                transition: Transition.fadeIn,
                duration: Duration(milliseconds: 800),
              );
            },
          ),
        ],
      ),
    );
  }
}
