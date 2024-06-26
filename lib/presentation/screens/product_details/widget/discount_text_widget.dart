import 'package:flutter/material.dart';

import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/product_details/product_details_controller.dart';
class DiscountTextWidget extends StatelessWidget {

  final ProductDetailsController controller;
  const DiscountTextWidget({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Text(
        " \$${controller.productPrice()}",
        style: semiBoldOverLarge.copyWith(
            fontSize: 13,
            color: MyColor.bodyTextColor,
            decoration: TextDecoration.lineThrough,
            decorationColor: MyColor.lineThroughColor,
            decorationThickness: 2.5,
            fontFamily: "Inter"
        ));
  }
}