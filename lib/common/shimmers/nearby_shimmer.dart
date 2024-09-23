import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:multi_shop/common/shimmers/shimmer_widget.dart';
import 'package:multi_shop/constants/constants.dart';

class NearbyShimmer extends StatelessWidget {
   NearbyShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, top: 10),
      height: 194.h,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 6,
          itemBuilder: (context, index) {
            return ShimmerWidget(
                shimmerWidth: width * 0.8,
                shimmerHieght: 180.h,
                shimmerRadius: 12);
          }),
    );
  }
}
