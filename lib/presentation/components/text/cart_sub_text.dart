import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:get/get.dart';
import 'package:shopron/config/utils/dimensions.dart';
import 'package:shopron/config/utils/style.dart';

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
