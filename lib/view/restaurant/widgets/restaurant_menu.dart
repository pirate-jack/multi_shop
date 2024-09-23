import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:multi_shop/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/hooks/foods_by_restaurant.dart';
import 'package:multi_shop/models/food.dart';
import 'package:multi_shop/models/api_error.dart';
import 'package:multi_shop/view/home/widgets/food_tile.dart';

class RestaurantMenuWidget extends HookWidget {
  RestaurantMenuWidget({super.key, required this.restaurantId});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchRestaurantFoods(restaurantId);
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
          : Center(child: Text('No food items found.')), // Handle case with no items
    );
  }
}