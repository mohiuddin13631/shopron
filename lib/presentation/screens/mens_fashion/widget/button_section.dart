import 'package:flutter/material.dart';
import 'package:shopron/domain/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:get/get.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../components/buttons/rounded_border_container.dart';
class ButtonSection extends StatelessWidget {
  const ButtonSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){},
          child: RoundedBorderContainer(
            text: MyStrings.reset.tr,
            bgColor: MyColor.textFieldDisableBorderColor,
            borderColor: MyColor.textFieldDisableBorderColor,
            textColor: MyColor.primaryTextColor,
            textSize: Dimensions.space14,
            horizontalPadding: Dimensions.space20,
            verticalPadding: Dimensions.space8,
          ),
        ),
        const SizedBox(width: Dimensions.space15),
        GestureDetector(
          onTap: (){Get.back();},
          child: RoundedBorderContainer(
            text: MyStrings.apply.tr,
            bgColor: MyColor.primaryColor,
            borderColor: MyColor.primaryColor,
            textColor: MyColor.colorWhite,
            textSize: Dimensions.space14,
            horizontalPadding: Dimensions.space20,
            verticalPadding: Dimensions.space8,
          ),
        )
      ],
    );
  }
}