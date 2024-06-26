import 'package:flutter/material.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../domain/controller/my_cart/my_cart_controller.dart';
class QuantityButton extends StatelessWidget {

  final MyCartController controller;
  final IconData icon;
  final Color bgColor;
  final VoidCallback press;
  final Color iconColor;

  const QuantityButton({
    super.key,
    required this.controller,
    required this.press,
    required this.icon,
    this.bgColor = MyColor.colorLightGrey,
    this.iconColor = MyColor.colorBlack
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: CircleAvatar(
        radius: Dimensions.addRemoveButtonRadius,
        backgroundColor: bgColor,
        child: Icon(icon,color: iconColor,size: Dimensions.addRemoveButtonSize),
      ),
    );
  }
}