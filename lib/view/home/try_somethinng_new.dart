import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_shop/common/background_container.dart';
import 'package:multi_shop/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/hooks/fetch_all_foods.dart';
import 'package:multi_shop/models/food.dart';
import 'widgets/food_tile.dart';

class TrySomethingNew extends HookWidget {
  const TrySomethingNew({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllFoods("394215");
    List<FoodModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;

    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        backgroundColor: kSecondary,
        title: Text(
          'Try Something New',
          style: TextStyle(
            color: kGray,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: isLoading
              ? FoodsListShimmer()
              : foods != null
              ? ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              foods.length,
                  (i) {
                FoodModel food = foods[i];
                return FoodTile(food: food);
              },
            ),
          )
              :FoodsListShimmer()
          // Center(child: Text("No foods available")), // Handle the null case
        ),
      ),
    );
  }
}