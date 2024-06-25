import 'package:flutter/material.dart';
import 'package:flutter_prime/data/controller/my_cart/my_cart_controller.dart';
import 'package:flutter_prime/data/controller/my_review/my_review_controller.dart';
import 'package:flutter_prime/view/components/text-form-field/custom_text_field.dart';
import 'package:flutter_prime/view/screens/my_cart/my_cart_screen.dart';
import 'package:flutter_prime/view/screens/my_review/widget/rating_section.dart';
import 'package:flutter_prime/view/screens/my_review/widget/recommendedReviewSection.dart';
import 'package:flutter_prime/view/screens/my_review/widget/recommended_review_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_images.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../core/utils/style.dart';
import '../../../../data/controller/product_details/product_details_controller.dart';
import '../../../components/bottom-sheet/bottom_sheet_header_row.dart';
import '../../../components/buttons/rounded_border_container.dart';
import '../../../components/buttons/custom_rounded_button.dart';
class SubmitReviewBottomSheet extends StatelessWidget {

  final MyReviewController  controller;

  const SubmitReviewBottomSheet({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    
    return Column(
      children: [
        const BottomSheetHeaderRow(
          header: MyStrings.submitReview,
          bottomSpace: Dimensions.space22,
          isTopIndicator: false,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .02,
        ),
        const RatingSection(),
        const SizedBox(height: Dimensions.space10),
        const RecommendedReviewSection(),
        const SizedBox(height: Dimensions.space10),
        Container(
          width: double.maxFinite,
          padding: Dimensions.chooseRatingPadding,
          decoration: BoxDecoration(
              border: Border.all(width: 1,color: MyColor.textFieldDisableBorderColor),
              borderRadius: BorderRadius.circular(5)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(MyStrings.howWasYourProduct.tr,style: regularDefaultInter.copyWith(color: MyColor.primaryTextColor,fontWeight: FontWeight.w600)),
              CustomTextField(
                controller: controller.reviewController,
                focusNode: controller.reviewFocusNode,
                textInputType: TextInputType.multiline,
                onChanged: (value){},
                labelText: MyStrings.writeHereAboutProduct,
                maxLines: 2,
              ),
              const SizedBox(height: 12,)
            ],
          ),
        ),
        const SizedBox(height: Dimensions.space8),
        CustomRoundedButton(
          press: () {},
          labelName: MyStrings.submit,
          isHorizontalPadding: false,
        )
      ],
    );
  }
}





