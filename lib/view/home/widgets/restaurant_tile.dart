import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/models/restaurant.dart';
import 'package:multi_shop/view/restaurant/restaurant_page.dart';

class RestaurantTile extends StatelessWidget {
  RestaurantTile({super.key, required this.restaurant});

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.to(() => RestaurantPage(restaurant: restaurant,));
        },
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 8.h),
              width: width,
              height: 70.h,
              decoration: BoxDecoration(
                color: kOffWhite,
                borderRadius: BorderRadius.circular(9.r),
              ),
              child: Container(
                padding: EdgeInsets.all(4.r),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12.r)),
                      child: Stack(
                        children: [
                          SizedBox(
                            width: 70.w,
                            height: 70.h,
                            child: Image.network(
                              restaurant.imageUrl,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 35.h,
                                  child: const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                );
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            child: Container(
                              padding: EdgeInsets.only(left: 6.w, bottom: 2.h),
                              color: kGray.withOpacity(0.6),
                              height: 16.h,
                              width: width,
                              child: RatingBarIndicator(
                                rating: 5,
                                itemCount: 5,
                                itemBuilder: (context, i) {
                                  return Icon(
                                    Icons.star,
                                    color: kSecondary,
                                  );
                                },
                                itemSize: 12.h,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          restaurant.title,
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: kDark),
                        ),
                        Text(
                          'Delivery Time :${restaurant.time}',
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                              color: kGray),
                        ),
                        SizedBox(
                          width: width * 0.7,
                          child: Text(
                            '${restaurant.coords.address}',
                            style: TextStyle(
                              fontSize: 12,
                              color: kGray,
                              fontWeight: FontWeight.w400,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              right: 5.w,
              top: 6.h,
              child: Container(
                width: 60.w,
                height: 18.h,
                decoration: BoxDecoration(
                  color: restaurant.isAvailable == true ||
                          restaurant.isAvailable == null
                      ? kPrimary
                      : kGrayLight,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Center(
                  child: Text(restaurant.isAvailable == true ||
                      restaurant.isAvailable == null ? 'Open' : 'Closed',style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: kLightWhite,
                    fontSize: 12
                  ),),
                ),
              ),
            )
          ],
        ));
  }
}
