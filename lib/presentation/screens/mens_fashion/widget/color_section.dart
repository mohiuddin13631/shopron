import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_images.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/mens_fashion/mens_fashion_controller.dart';
import 'custom_check_box_circular.dart';
class ColorSection extends StatelessWidget {

  final MensFashionController controller;

  const ColorSection({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MyStrings.color.tr,style: semiBoldLargeInter.copyWith(fontWeight: FontWeight.w700,fontSize: Dimensions.space14)),
        const SizedBox(height: Dimensions.space20),
        Column(
          children: List.generate(4, (index) => GestureDetector(
            onTap: ()=>controller.setColorSectionCurrentIndex(index),
            child: Padding(
              padding: const EdgeInsets.only(bottom: Dimensions.space16),
              child: Row(
                children: [
                  Text(controller.brandSectionList[index].tr,style: regularDefaultInter.copyWith(fontSize: Dimensions.space13,color: MyColor.primaryTextColor)),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(Dimensions.space4),
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      color: controller.colorList[index],
                    ),
                    child: controller.colorSectionCurrentIndex == index ? SvgPicture.asset(MyImages.check):const SizedBox.shrink(),
                  )
                ],
              ),
            ),
          )),
        ),
      ],
    );
  }
}