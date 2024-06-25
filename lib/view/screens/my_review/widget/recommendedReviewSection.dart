import 'package:flutter/material.dart';
import 'package:flutter_prime/view/screens/my_review/widget/recommended_review_widget.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../core/utils/style.dart';
class RecommendedReviewSection extends StatelessWidget {

  const RecommendedReviewSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.maxFinite,
      padding: Dimensions.chooseRatingPadding,
      decoration: BoxDecoration(
          border: Border.all(width: 1,color: MyColor.textFieldDisableBorderColor),
          borderRadius: BorderRadius.circular(Dimensions.space5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MyStrings.whatCouldBeBetter.tr,style: regularDefaultInter.copyWith(color: MyColor.primaryTextColor,fontWeight: FontWeight.w600)),
          const SizedBox(height: Dimensions.space12),
           const Row(
            children: [
              RecommendedReviewWidget(text: MyStrings.delivery),
              RecommendedReviewWidget(text: MyStrings.delivery),
              RecommendedReviewWidget(text: MyStrings.order),
              RecommendedReviewWidget(text: MyStrings.quality),
            ],
          ),
          const SizedBox(height: Dimensions.space11),
          const Row(
            children: [
              RecommendedReviewWidget(text: MyStrings.valueForMoney),
              RecommendedReviewWidget(text: MyStrings.saler),
              RecommendedReviewWidget(text: MyStrings.pakaging),
            ],
          )
        ],
      ),
    );
  }
}