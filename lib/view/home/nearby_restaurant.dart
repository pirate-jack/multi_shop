import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_shop/common/background_container.dart';
import 'package:multi_shop/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/hooks/fetch_all_restaurants.dart';
import 'package:multi_shop/models/restaurant.dart';
import 'package:multi_shop/view/home/widgets/restaurant_tile.dart';

class AllNearbyRestaurant extends HookWidget {
  const AllNearbyRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchAllRestaurant('394215');
    List<RestaurantModel>? restaurants = hookResult.data;
    final isLoading = hookResult.isLoading;
    if (isLoading) {
      return Center(child: CircularProgressIndicator(color: kPrimary,));
    } else if (restaurants == null || restaurants.isEmpty) {
      return Center(child: Scaffold(
        backgroundColor: kSecondary,
        appBar: AppBar(
          backgroundColor: kSecondary,
          title: Text(
            'All Nearby Restaurant',
            style: TextStyle(color: kGray, fontWeight: FontWeight.bold),
          ),
          elevation: 0.3,
        ),
        body: BackgroundContainer(
          color: Colors.white,
          child: isLoading ? FoodsListShimmer() : Padding(
            padding:  EdgeInsets.all(12.h),
            child: Center(
              child: CircularProgressIndicator(),
            )
          ),
        ),
      ));
    }

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        backgroundColor: kSecondary,
        title: Text(
          'All Nearby Restaurant',
          style: TextStyle(color: kGray, fontWeight: FontWeight.bold),
        ),
        elevation: 0.3,
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: isLoading ? FoodsListShimmer() : Padding(
          padding:  EdgeInsets.all(12.h),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              restaurants!.length,
                  (i) {
                RestaurantModel restaurant = restaurants[i];
                return RestaurantTile(restaurant:restaurant,);
              },
            ),
          ),
        ),
      ),
    );
  }
}
