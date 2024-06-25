import 'package:flutter/material.dart';
import 'package:flutter_prime/data/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/my_color.dart';
import '../../../core/utils/my_images.dart';
import '../../../data/controller/shipping_address/shipping_address_controller.dart';
class CircularCheckBox extends StatelessWidget {

  final ShippingAddressController controller;
  final int index;

  const CircularCheckBox({
    super.key,
    required this.controller,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      height: 18,
      width: 18,
      decoration: BoxDecoration(
        color: controller.currentIndex == index ? MyColor.primaryColor : null,
        border: controller.currentIndex != index ? Border.all(color: MyColor.colorGrey.withOpacity(.6),width: 1): null,
        shape: BoxShape.circle
      ),
      child: controller.currentIndex == index ? SvgPicture.asset(MyImages.check):const SizedBox.shrink(),
    );
  }
}