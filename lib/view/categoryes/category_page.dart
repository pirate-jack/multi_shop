import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_shop/common/background_container.dart';
import 'package:multi_shop/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/catogory_contoller.dart';
import 'package:multi_shop/hooks/fetch_category_foods.dart';
import 'package:multi_shop/models/food.dart';
import 'package:multi_shop/view/home/widgets/food_tile.dart';

class CategoryPage extends HookWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    final hookResults = useFetchFoodsByCategory("394215");
    List<FoodModel>? foods = hookResults.data;
    final isLoading = hookResults.isLoading;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:  () {
          controller.updateCategory = "";
          controller.updateTitle = "";
          Get.back();
        }, icon: Icon(CupertinoIcons.back)),
        title: Text(
          '${controller.updateTitle} Category',
          style: TextStyle(fontWeight: FontWeight.w600, color: kGray),
        ),
        elevation: 0,
        backgroundColor: kSecondary,
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Container(
          height: height,
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: isLoading
              ? FoodsListShimmer()
              : foods != null && foods.isNotEmpty
                  ? ListView.builder(
                      itemCount: foods.length,
                      itemBuilder: (context, i) {
                        FoodModel food = foods[i];
                        return FoodTile(food: food, color: Colors.white);
                      },
                    )
                  : Center(child: Text('No foods available')),
        ),
      ),
    );
  }
}
