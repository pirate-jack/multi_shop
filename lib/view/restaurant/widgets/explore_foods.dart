import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multi_shop/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/hooks/fetch_food.dart';
import 'package:multi_shop/models/food.dart';
import 'package:multi_shop/view/home/widgets/food_tile.dart';

class ExploreFoods extends HookWidget {
  ExploreFoods({super.key, required this.code});

  final String code;

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchFoods(code);
    final foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    final error = hookResults.error;

    return Scaffold(
      backgroundColor: kLightWhite,
      body: isLoading
          ? FoodsListShimmer()
          : error != null
              ? Center(child: Text('Error: ${error.toString()}'))
              : foods != null && foods.isNotEmpty
                  ? Container(
                      height: height * 0.7,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: foods.length,
                        itemBuilder: (context, index) {
                          final FoodModel food = foods[index];
                          return FoodTile(food: food);
                        },
                      ),
                    )
                  : Center(
                      child: Text(
                          'No food items found.')), // Handle case with no items
    );
  }
}
