import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:multi_shop/contollers/catogory_contoller.dart';
import 'package:multi_shop/models/category.dart';
import 'package:multi_shop/view/categoryes/allcategoryes.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({required this.category});

 final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return GestureDetector(
      onTap: () {
        if (controller.updateCategory == category.id) {
          controller.updateCategory = '';
          controller.updateTitle = '';

        } else if (category.title == 'More') {
          Get.to(
            () => Allcategoryes(),
            transition: Transition.fadeIn,
            duration: Duration(milliseconds: 500),
          );
        } else {
          controller.updateCategory = category.id;
          controller.updateTitle = category.title;
        }
      },
      child: Obx(
        () => Container(
          margin: EdgeInsets.only(right: 5.w),
          padding: EdgeInsets.only(top: 4.h),
          width: width * 0.19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            border: Border.all(
              color: controller.updateCategory == category.id
                  ? kSecondary
                  : kOffWhite,
              width: .7.w,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 35.h,
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
              Text(
                category.title,
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
