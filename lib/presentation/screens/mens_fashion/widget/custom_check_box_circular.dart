import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shopron/domain/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_images.dart';

class CustomCheckBoxCircular extends StatelessWidget {

  final MensFashionController controller;
  final int index;

  const CustomCheckBoxCircular({
    super.key,
    required this.controller,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(Dimensions.space4),
      height: Dimensions.space18,
      width: Dimensions.space18,
      decoration: BoxDecoration(
          color: controller.mensFashionCurrentIndex == index ? MyColor.primaryColor : null,
          border: controller.mensFashionCurrentIndex != index ? Border.all(color: MyColor.colorGrey.withOpacity(.6),width: 1): null,
          shape: BoxShape.circle
      ),
      child: controller.mensFashionCurrentIndex == index ? SvgPicture.asset(MyImages.check):const SizedBox.shrink(),
    );
  }
}