import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_shop/common/background_container.dart';
import 'package:multi_shop/common/shimmers/foodlist_shimmer.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/hooks/fetch_all_category.dart';
import 'package:multi_shop/models/category.dart';
import 'package:multi_shop/view/categoryes/categoryTile.dart';

class Allcategoryes extends HookWidget {
   Allcategoryes({super.key});
  @override
  Widget build(BuildContext context) {
    final hookResults = useFetchAllCategory();
    List<CategoryModel>? categorys = hookResults.data;
    final isLoading = hookResults.isLoading;

    if(categorys == null || categorys.isEmpty){
      return Center(child: CircularProgressIndicator(color: kPrimary,));
    }
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: Text(
          'All Categorys',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
            color: kGray,
          ),
        ),
      ),
      body: BackgroundContainer(
        color: Colors.white,
        child: Container(
          height: height,
          padding: EdgeInsets.only(left: 12.w, top: 10.h),
          child: isLoading ? FoodsListShimmer() : ListView(
            scrollDirection: Axis.vertical,
            children: List.generate(
              categorys!.length,
              (i) {
                CategoryModel category = categorys[i];
                return CategoryTile(category: category);
              },
            ),
          ),
        ),
      ),
    );
  }
}
