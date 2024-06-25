import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_prime/core/utils/style.dart';

class SmallText extends StatelessWidget {

  final String text;
  final TextAlign? textAlign;
  final TextStyle textStyle;
  final int maxLine;

  const SmallText({
    Key? key,
    required this.text,
    this.textAlign,
    this.maxLine = 1,
    this.textStyle = regularSmall
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: textAlign,
      style: textStyle,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
