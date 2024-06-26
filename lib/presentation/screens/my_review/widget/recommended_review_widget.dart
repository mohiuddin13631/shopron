import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
class RecommendedReviewWidget extends StatelessWidget {

  final String text;

  const RecommendedReviewWidget({
    super.key,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10,vertical: Dimensions.space6),
          decoration: BoxDecoration(
              border: Border.all(width: 1,color: MyColor.textFieldDisableBorderColor),
              shape: BoxShape.circle
          ),
          child: Text(text.tr,style: regularDefaultInter.copyWith(color: MyColor.contentTextColor,fontWeight: FontWeight.w500)),
        ),
        const SizedBox(width: Dimensions.space8)
      ],
    );
  }
}