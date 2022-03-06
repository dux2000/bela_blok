import 'package:bella_tzp/constants/constants.dart';
import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  const BigText(
      {Key? key,
      required this.text,
      this.color = Constants.gold,
      this.fontSize = 24})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          letterSpacing: 1.2),
    );
  }
}
