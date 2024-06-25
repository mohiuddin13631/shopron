import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:get/get.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/style.dart';

class CartSubText extends StatelessWidget {

  final String text;
  final Color? textColor;
  final double fontSize;

  const CartSubText({
    Key? key,
    required this.text,
    this.textColor = MyColor.cartSubtitleColor,
    this.fontSize = 12
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: regularDefaultInter.copyWith(color: textColor,height: 1.7,wordSpacing: 2,fontSize: fontSize),
    );
  }
}
