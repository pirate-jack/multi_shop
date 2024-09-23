import 'package:flutter/cupertino.dart';
import 'package:multi_shop/constants/constants.dart';
import 'package:lottie/lottie.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      child: Padding(
        padding: EdgeInsets.only(bottom: 180),
        child: LottieBuilder.asset("assets/anime/search.json",
            width: width/2,
            height: height/4,
        ),
      ),
    );
  }
}
