import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/catogory_contoller.dart';
import 'package:multi_shop/models/category.dart';
import 'package:multi_shop/view/categoryes/category_page.dart';

class CategoryTile extends StatelessWidget {
  CategoryTile({super.key ,required this.category});
 final CategoryModel category;
  @override
  Widget build(BuildContext context) {
final controller = Get.put(CategoryController());
    return ListTile(
      onTap: () {
        controller.updateCategory = category.id;
        controller.updateTitle = category.title;
        Get.to(() => CategoryPage(),

            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 500));
      },
      leading: CircleAvatar(
        radius: 18.r,
        backgroundColor: kGrayLight,
        child: Image.network(
          category.imageUrl,
          fit: BoxFit.contain,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 35.h,
              child: const Icon(
                Icons.error,
                color: Colors.red,
              ),
            );
          },
        ),
      ),
      title: Text(
        category.title,
        style: TextStyle(color: kGray),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_rounded,
        color: kGray,
        size: 15.r,
      ),
    );
  }
}

