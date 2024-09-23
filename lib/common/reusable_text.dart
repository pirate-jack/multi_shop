import 'package:flutter/material.dart';

class ReusableText extends StatelessWidget {
  ReusableText(this.text, this.fontSize, this.color, this.fontWeight);
  String text;
  double fontSize;
  Color color;
  var fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
