import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:multi_shop/common/custom_container.dart';
import 'package:multi_shop/common/custom_text_filed.dart';
import 'package:multi_shop/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/search_controller.dart';
import 'package:multi_shop/view/search/loading_widget.dart';
import 'package:multi_shop/view/search/search_resuls.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

final TextEditingController _searchController = TextEditingController();

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Obx(
      () => Scaffold(
        backgroundColor: kPrimary,
        appBar: AppBar(
          toolbarHeight: 74.h,
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Padding(
            padding: EdgeInsets.only(top: 12.h),
            child: CustomTextWidget(
              controller: _searchController,
              keyboardType: TextInputType.text,
              hintText: "Search for Foods",
              suffixIcon: GestureDetector(
                onTap: () {
                  if (controller.isTriggered == false) {
                    controller.searchFood(_searchController.text);
                    controller.isTriggered = true;
                  } else {
                    controller.searchResult = null;
                    controller.isTriggered = false;
                    _searchController.clear();
                  }
                },
                child: controller.isTriggered == false
                    ? Icon(
                        Ionicons.search_circle,
                        size: 30,
                        color: kPrimary,
                      )
                    : Icon(
                        Ionicons.close_circle,
                        size: 30,
                        color: kRed,
                      ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: CustomContainer(
            color: Colors.white,
            containerContent: controller.isLoading
                ? FoodsListShimmer()
                : controller.searchResult == null
                    ? LoadingWidget()
                    : SearchResuls(),
          ),
        ),
      ),
    );
  }
}
