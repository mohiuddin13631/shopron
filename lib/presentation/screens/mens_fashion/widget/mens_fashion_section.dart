import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/mens_fashion/mens_fashion_controller.dart';
import 'custom_check_box_circular.dart';
class MensFashionSection extends StatelessWidget {

  final MensFashionController controller;

  const MensFashionSection({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MyStrings.mensFashion.tr,style: semiBoldLargeInter.copyWith(fontWeight: FontWeight.w500,fontSize: 12)),
        const SizedBox(height: Dimensions.space8,),
        Column(
          children: List.generate(4, (index) => GestureDetector(
            onTap: ()=>controller.setMensFashionCurrentIndex(index),
            child: Padding(
              padding: const EdgeInsets.only(bottom: Dimensions.space22),
              child: Row(
                children: [
                  Container(
                    width: Dimensions.space6,
                    height: Dimensions.space3,
                    color: MyColor.iconColor,
                  ),
                  const SizedBox(width: Dimensions.space13),
                  Text(controller.mensFashionList[index],style: regularDefaultInter.copyWith(fontSize: Dimensions.space13)),
                  const Spacer(),
                  CustomCheckBoxCircular(controller: controller, index: index)
                ],
              ),
            ),
          )),
        ),
      ],
    );
  }
}