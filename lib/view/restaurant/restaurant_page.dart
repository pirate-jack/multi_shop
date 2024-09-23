import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/models/restaurant.dart';
import 'package:multi_shop/view/restaurant/direction_page.dart';
import 'package:multi_shop/view/restaurant/widgets/explore_foods.dart';
import 'package:multi_shop/view/restaurant/widgets/restaurant_Bottom_RatingBar.dart';
import 'package:multi_shop/view/restaurant/widgets/restaurant_menu.dart';
import 'package:multi_shop/view/restaurant/widgets/row_text.dart';

class RestaurantPage extends StatefulWidget {
  RestaurantPage({super.key, this.restaurant});

  final RestaurantModel? restaurant;

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage>
    with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kLightWhite,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: width,
                  child: CachedNetworkImage(
                    imageUrl: widget.restaurant!.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: RestaurantBottomBar(
                    widget: widget,
                  ),
                ),
                Positioned(
                  top: 40.h,
                  child: Container(
                    color: kPrimary.withOpacity(0.4),
                    padding: EdgeInsets.symmetric(horizontal: 12.h),
                    width: width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Ionicons.chevron_back,
                            size: 28,
                            color: kLightWhite,
                          ),
                        ),
                        Text(
                          widget.restaurant!.title,
                          style: const TextStyle(
                            fontSize: 20,
                            color: kWhite,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Get.to(
                              () => DirectionPage(),
                              transition: Transition.fadeIn,
                              duration: const Duration(milliseconds: 800),
                            );
                          },
                          icon: Icon(
                            Ionicons.location_outline,
                            size: 28,
                            color: kLightWhite,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  RowText(
                    first: "Distance to Restaurant",
                    second: "2.7 km",
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  RowText(
                    first: "Estimated Price",
                    second: "\$ 2.7 ",
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  RowText(
                    first: "Estimated Time",
                    second: "30 min",
                  ),
                  Divider(
                    thickness: 0.7,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: SizedBox(
                height: 25.h,
                width: width,
                child: TabBar(
                  unselectedLabelColor: kGrayLight,
                  dividerColor: Colors.transparent,
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: kPrimary,
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  labelPadding: EdgeInsets.zero,
                  labelColor: kLightWhite,
                  tabs: [
                    Tab(
                      child: SizedBox(
                          height: 25.h,
                          width: width / 2,
                          child: Center(child: Text("Menu"))),
                    ),
                    Tab(
                      child: SizedBox(
                          height: 25.h,
                          width: width / 2,
                          child: Center(child: Text("Explore"))),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: SizedBox(
                height: height,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RestaurantMenuWidget(
                      restaurantId: widget.restaurant!.id.toString(),
                    ),
                   ExploreFoods(code: widget.restaurant!.code),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
