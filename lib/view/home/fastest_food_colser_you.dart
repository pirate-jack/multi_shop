import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_shop/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/hooks/fetch_all_foods.dart';
import 'package:multi_shop/models/food.dart';
import 'package:multi_shop/view/home/widgets/food_tile.dart';

class FastestFoodCloserYou extends HookWidget {
  const FastestFoodCloserYou({super.key});

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
          'Fastest Food Closer You',
          style: TextStyle(
            color: kGray,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0.3,
      ),
      body: Container(
        color: Colors.white,
        child: isLoading
            ? FoodsListShimmer()
            : foods != null && foods.isNotEmpty
            ?  Padding(
          padding: EdgeInsets.all(12.h),
          child:ListView.builder(
            itemCount: foods.length,
            itemBuilder: (context, i) {
              FoodModel food = foods[i];
              return FoodTile(food: food);
            },
          )

        ) : Center(child: Text("No foods available")),
      ),
    );
  }
}