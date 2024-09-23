import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_shop/constants/constants.dart';

class RestaurantWidget extends StatelessWidget {
  RestaurantWidget(
      {super.key,
      required this.image,
      required this.logo,
      required this.title,
      required this.time,
      required this.rating,
      this.onTap});

  final String image;
  final String logo;
  final String title;
  final String time;
  final String rating;
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: 12.w),
        child: Container(
          width: width * .75,
          height: 192.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            color: kWhite,
          ),
          child: ListView(
            physics: NeverScrollableScrollPhysics(),
            children: [
              Padding(
                padding: EdgeInsets.all(8),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: SizedBox(
                        height: 115.h,
                        width: width * .8.w,
                        child: Image.network(
                          image,
                          fit: BoxFit.fitWidth,
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
                    ),
                    Positioned(
                        right: 10.w,
                        top: 7.h,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50.r),
                          child: Container(
                            color: kLightWhite,
                            child: Padding(
                              padding: EdgeInsets.all(2.h),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50.r),
                                child: Image.network(
                                  logo,
                                  fit: BoxFit.cover,
                                  width: 35.w,
                                  height: 20.h,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      height: 25.h,
                                      child: const Icon(
                                        Icons.error,
                                        color: Colors.red,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: kDark,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Delivery Time',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: kGray,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            color: kDark,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        RatingBarIndicator(
                          itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: kPrimary,
                          ),
                          rating: 5,
                          itemCount: 5,
                          itemSize: 15.h,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text('+${rating} ratings and reviews',style: TextStyle(
                          fontSize: 10,
                          color: kGray,
                          fontWeight: FontWeight.w500
                        ),),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
