import 'package:flutter/material.dart';
import 'package:multi_shop/constants/constants.dart';

class RowText extends StatelessWidget {
  const RowText({super.key, required this.first, required this.second});

  final String first;
  final String second;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          first,
          style: TextStyle(
            fontSize: 13,
            color: kGray,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          second,
          style: TextStyle(
            fontSize: 13,
            color: kGray,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
