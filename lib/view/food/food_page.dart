import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:multi_shop/common/custom_button.dart';
import 'package:multi_shop/common/custom_text_filed.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/food_controller.dart';
import 'package:multi_shop/hooks/fetch_restaurant.dart';
import 'package:multi_shop/models/food.dart';
import 'package:multi_shop/view/auth/phoneVerificationPage.dart';
import 'package:multi_shop/view/restaurant/restaurant_page.dart';

class FoodPage extends StatefulHookWidget {
  const FoodPage({super.key, required this.food});

  final FoodModel food;

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final PageController _pageController = PageController();
  final TextEditingController _preferences = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchRestaurant(widget.food.restaurant);
    final controller = Get.put(FoodController());
    controller.loadAdditives(widget.food.additives);
    return Scaffold(
      body: ListView(
        // physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(35.r),
            ),
            child: Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  child: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (i) {
                      controller.currentPage(i);
                    },
                    itemCount: widget.food.imageUrl.length,
                    itemBuilder: (context, index) {
                      return Container(
                          width: width,
                          height: 230,
                          color: kGray,
                          child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: widget.food.imageUrl[index],
                          ));
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Obx(
                      () => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            widget.food.imageUrl.length,
                            (index) {
                              return Container(
                                margin: EdgeInsets.all(4.h),
                                width: 10.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: controller.currentPage == index
                                      ? kSecondary
                                      : kGrayLight,
                                ),
                              );
                            },
                          )),
                    ),
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 10.w,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_outlined,
                      color: kLightWhite,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10.h,
                  right: 12.w,
                  child: CustomButton(
                    onTap: () {
                      Get.to(() => RestaurantPage(
                            restaurant: hookResult.data,
                          ));
                    },
                    btnWidth: 100.w,
                    text: "Open Restaurant",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.food.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Obx(
                        () => Text(
                          '\$ ${((widget.food.price + controller.additivePrice) * controller.count.value).toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: 20,
                            color: kPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    widget.food.description,
                    textAlign: TextAlign.justify,
                    maxLines: 8,
                    style: TextStyle(
                        fontSize: 12,
                        color: kGray,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  SizedBox(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          widget.food.foodTags.length,
                          (index) {
                            final tag = widget.food.foodTags[index];
                            return Container(
                              margin: EdgeInsets.only(right: 3.w),
                              decoration: BoxDecoration(
                                color: kPrimary,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.r)),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 6.w),
                                child: Text(
                                  tag,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    "Additives And Toppings",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(
                    () => Column(
                      children: List.generate(
                        controller.additivesList.length,
                        (index) {
                          final additives = controller.additivesList[index];
                          return CheckboxListTile(
                            contentPadding: EdgeInsets.zero,
                            visualDensity: VisualDensity.compact,
                            activeColor: kPrimary,
                            tristate: false,
                            dense: true,
                            value: additives.isChecked.value,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  additives.title,
                                  textAlign: TextAlign.justify,
                                  maxLines: 8,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: kDark,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "\$ ${additives.price.toStringAsFixed(2)}",
                                  textAlign: TextAlign.justify,
                                  maxLines: 8,
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: kGray,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            onChanged: (bool? value) {
                              additives.toggleChecked();
                              controller.getTotalPrice();
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Qauntity",
                        textAlign: TextAlign.justify,
                        maxLines: 8,
                        style: TextStyle(
                            fontSize: 18,
                            color: kDark,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.decrement();
                            },
                            child: Icon(AntDesign.minuscircleo),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.w),
                              child: Obx(
                                () => Text(
                                  controller.count.value.toString(),
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              controller.increment();
                            },
                            child: Icon(AntDesign.pluscircleo),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    "Preferences",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    height: 65.h,
                    child: CustomTextWidget(
                      controller: _preferences,
                      hintText: "Add a note with your Preferences",
                      maxLines: 3,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: kPrimary,
                      borderRadius: BorderRadius.circular(30.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            _showVerificationSheet(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              "Place Order",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            backgroundColor: kSecondary,
                            radius: 20.r,
                            child: Icon(
                              Ionicons.cart_outline,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showVerificationSheet(BuildContext context) async {
    await showModalBottomSheet(
      showDragHandle: false,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          width: width,
          height: 525.h,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/restaurant_bk.png"),
              fit: BoxFit.fill,
            ),
            color: kLightWhite,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(12.r),
              topLeft: Radius.circular(12.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(8.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Verify Your Phone Number",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                    color: kPrimary,
                  ),
                ),
                SizedBox(
                  //height: 260.h,
                  child: Column(
                    children: List.generate(
                      verificationReasons.length,
                      (index) {
                        return ListTile(
                          leading: Icon(
                            Icons.check_circle_outline,
                            color: kPrimary,
                          ),
                          title: Text(
                            verificationReasons[index],
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: kGrayLight,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomButton(
                  text: "Verify Your Phone Number",
                  btnHeight: 35,
                  onTap: () {
                    Get.to(() => PhoneVerificationPage());
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
