import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  // ignore: use_super_parameters
  const TextWidget({
    Key? key,
    required this.lable,
    this.fontSize = 18,
    this.color,
    this.fontweight,
  }) : super(key: key);

  final String lable;
  final double fontSize;
  final Color? color;
  final FontWeight? fontweight;
  @override
  Widget build(BuildContext context) {
    return Text(
      lable,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: fontSize,
        fontWeight: fontweight ?? FontWeight.w500,
     fontFamily: 'Gulzar',
      ),
    );
  }
}
