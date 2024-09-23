import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/search_controller.dart';
import 'package:multi_shop/models/food.dart';
import 'package:multi_shop/view/home/widgets/food_tile.dart';

class SearchResuls extends StatelessWidget {
  const SearchResuls({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Container(
      padding: EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
      height: height,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 215),
        child: ListView.builder(
          itemCount: controller.searchResult!.length,
          itemBuilder: (context, index) {
            FoodModel food = controller.searchResult![index];
            return FoodTile(food: food);
          },
        ),
      ),
    );
  }
}
