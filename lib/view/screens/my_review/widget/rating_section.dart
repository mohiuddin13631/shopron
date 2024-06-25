import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../core/utils/style.dart';
class RatingSection extends StatelessWidget {

  const RatingSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.maxFinite,
      padding: Dimensions.chooseRatingPadding,
      decoration: BoxDecoration(
          border: Border.all(width: 1,color: MyColor.textFieldDisableBorderColor),
          borderRadius: BorderRadius.circular(5)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(MyStrings.chooseYourRating.tr,style: regularDefaultInter.copyWith(color: MyColor.primaryTextColor,fontWeight: FontWeight.w600)),
          const SizedBox(height: Dimensions.space8,),
          RatingBar.builder(
            initialRating: 0,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemSize: Dimensions.space22,
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: MyColor.colorOrange,
            ),
            onRatingUpdate: (rating) {},
          ),
        ],
      ),
    );
  }
}