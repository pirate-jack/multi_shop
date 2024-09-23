import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_shop/common/custom_appbar.dart';
import 'package:multi_shop/common/custom_container.dart';
import 'package:multi_shop/common/heading.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/catogory_contoller.dart';
import 'package:multi_shop/view/home/fastest_food_colser_you.dart';
import 'package:multi_shop/view/home/nearby_restaurant.dart';
import 'package:multi_shop/view/home/try_somethinng_new.dart';
import 'package:multi_shop/view/home/widgets/category_foods_list.dart';
import 'package:multi_shop/view/home/widgets/catogory_list.dart';
import 'package:multi_shop/view/home/widgets/food_list.dart';
import 'package:multi_shop/view/home/widgets/nearby_restarunt_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(130.h),
        child: Container(
          child: CustomAppbar(),
          height: 130,
        ),
      ),
      body: SafeArea(
        child: CustomContainer(
          containerContent: Column(
            children: [
              CategoryList(),
              Obx(() {
                if (controller.updateCategory == "") {
                  return Column(
                    children: [
                      Heading(
                        text: 'Try Something New',
                        onTap: () {
                          Get.to(
                                () => TrySomethingNew(),
                            transition: Transition.fadeIn,
                            duration: Duration(milliseconds: 800),
                          );
                        },
                      ),
                      FoodList(),
                      Heading(
                        text: 'NearBy Restaurants',
                        onTap: () {
                          Get.to(
                                () => AllNearbyRestaurant(),
                            transition: Transition.fadeIn,
                            duration: Duration(milliseconds: 800),
                          );
                        },
                      ),
                      NearbyRestaruntList(),
                      Heading(
                        text: 'Fastest Food Closer You',
                        onTap: () {
                          Get.to(
                                () => FastestFoodCloserYou(),
                            transition: Transition.fadeIn,
                            duration: Duration(milliseconds: 800),
                          );
                        },
                      ),
                      FoodList(),
                    ],
                  );
                } else {
                  return CustomContainer(
                    containerContent: Column(
                      children: [
                        Heading(
                          text: 'Explore ${controller.updateTitle} Category',
                          more: false,
                        ),
                        CategoryFoodsList(),
                      ],
                    ),
                  );
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}