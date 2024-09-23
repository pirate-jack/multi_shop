import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_shop/common/shimmers/nearby_shimmer.dart';
import 'package:multi_shop/hooks/fetch_food.dart';
import 'package:multi_shop/view/food/food_page.dart';
import 'package:multi_shop/view/home/widgets/food_widget.dart';

class FoodList extends HookWidget {
  const FoodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchFoods("394215");
    final foods = hookResult.data;
    final isLoading = hookResult.isLoading;

    if (isLoading) {
      return SizedBox(
        height: 180.h,
        child: NearbyShimmer(),
      );
    }

    if (foods == null || foods.isEmpty) {
      return SizedBox(
        height: 180.h,
        child: Center(
          child: NearbyShimmer(),
        ),
      );
    }
    return Container(
      height: 180.h,
      padding: EdgeInsets.only(
        left: 10.w,
        top: 10.w,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foods.length,
        itemBuilder: (context, i) {
          final food = foods[i];
          return FoodWidget(
            image: food.imageUrl[0],
            title: food.title,
            time: food.time,
            price: food.price.toStringAsFixed(2),
            onTap: () {
              Get.to(FoodPage(food: food),
                transition: Transition.fadeIn,
                duration: Duration(milliseconds: 800),
              );
            },
          );
        },
      ),
    );
  }
}
