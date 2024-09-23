import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_shop/common/shimmers/nearby_shimmer.dart';
import 'package:multi_shop/constants/uidata.dart';
import 'package:multi_shop/hooks/fetch_restaurants.dart';
import 'package:multi_shop/models/restaurant.dart';
import 'package:multi_shop/view/home/widgets/restaurant_widget.dart';
import 'package:multi_shop/view/restaurant/restaurant_page.dart';

class NearbyRestaruntList extends HookWidget {
  const NearbyRestaruntList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurants('394215');
    List<RestaurantModel> ? restaurants = hookResult.data;
    final isLoading = hookResult.isLoading;

    if (isLoading) {
      return NearbyShimmer();
    } else if (restaurants == null || restaurants.isEmpty) {
      return Center(child: NearbyShimmer());
    }
    return  Container(
      height: 194.h,
      padding: EdgeInsets.only(
        left: 10.w,
        top: 10.w,
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(
          restaurants!.length,
          (i) {
            RestaurantModel restaurant = restaurants[i];
            return RestaurantWidget(
              onTap: () => Get.to(()=> RestaurantPage(restaurant: restaurant)),
                image: restaurant.imageUrl,
                logo: restaurant.logoUrl,
                title: restaurant.title,
                time: restaurant.time,
                rating: "6544");
          },
        ),
      ),
    );
  }
}
