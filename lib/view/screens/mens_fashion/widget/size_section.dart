import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_images.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../core/utils/style.dart';
import '../../../../data/controller/mens_fashion/mens_fashion_controller.dart';
import 'custom_check_box_circular.dart';
class SizeSection extends StatelessWidget {

  final MensFashionController controller;

  const SizeSection({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MyStrings.size,style: semiBoldLargeInter.copyWith(fontWeight: FontWeight.w700,fontSize: 14)),
        const SizedBox(height: Dimensions.space20),
        Column(
          children: List.generate(4, (index) => GestureDetector(
            onTap: ()=>controller.setSizeSectionCurrentIndex(index),
            child: Padding(
              padding: const EdgeInsets.only(bottom: Dimensions.space16),
              child: Row(
                children: [
                  Text(controller.sizeList[index],style: regularDefaultInter.copyWith(fontSize: Dimensions.space13,color: MyColor.primaryTextColor)),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(Dimensions.space4),
                    height: Dimensions.space18,
                    width: Dimensions.space18,
                    decoration: BoxDecoration(
                        color: controller.sizeSectionCurrentIndex == index ? MyColor.primaryColor : null,
                        border: controller.sizeSectionCurrentIndex != index ? Border.all(color: MyColor.colorGrey.withOpacity(.6),width: 1): null,
                        shape: BoxShape.circle
                    ),
                    child: controller.sizeSectionCurrentIndex == index ? SvgPicture.asset(MyImages.check):const SizedBox.shrink(),
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