import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_shop/common/shimmers/categories_shimmer.dart';
import 'package:multi_shop/hooks/fetch_category.dart';
import 'package:multi_shop/models/category.dart';
import 'package:multi_shop/view/home/widgets/category_widget.dart';

class CategoryList extends HookWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final hookResult = useFetchCategory();
    List<CategoryModel>? categoryList = hookResult.data;
    final isLoading = hookResult.isLoading;
    if (categoryList == null || categoryList.isEmpty) {
      return Container(child: CatergoriesShimmer());
    }
    return isLoading
        ? CatergoriesShimmer()
        : Container(
            height: 80.h,
            padding: EdgeInsets.only(
              left: 10.w,
              top: 10.w,
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                categoryList!.length,
                (i) {
                  CategoryModel category = categoryList[i];
                  return CategoryWidget(
                    category: category,
                  );
                },
              ),
            ),
          );
  }
}
