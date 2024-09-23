import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_shop/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/hooks/fetch_category_foods.dart';
import 'package:multi_shop/models/food.dart';
import 'package:multi_shop/view/home/widgets/food_tile.dart';
class CategoryFoodsList extends HookWidget {
  const CategoryFoodsList({super.key});

  @override
  Widget build(BuildContext context) {

    final hookResults = useFetchFoodsByCategory("394215");
    List<FoodModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    print("Foods : ${foods}");
    return SizedBox(
      height: height,
      width: width,
      child: isLoading
          ? FoodsListShimmer()
          : Padding(
        padding: EdgeInsets.all(12.h),
        child: foods == null || foods.isEmpty
            ? Center(child: Text('No foods available.'))
            : ListView.builder(
          itemCount: foods.length,
          itemBuilder: (context, i) {
            FoodModel food = foods[i];
            return FoodTile(food: food, color: Colors.white);
          },
        ),

      ),
    );
  }
}