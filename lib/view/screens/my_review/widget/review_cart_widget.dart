import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prime/data/controller/my_review/my_review_controller.dart';
import 'package:flutter_prime/view/screens/my_cart/widget/quantity_button.dart';
import 'package:flutter_prime/view/screens/my_review/widget/submit_review_bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_images.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../core/utils/style.dart';
import '../../../../data/controller/my_cart/my_cart_controller.dart';
import '../../../components/bottom-sheet/custom_bottom_sheet.dart';
import '../../../components/divider/horizontal_divider.dart';
import '../../my_cart/widget/coupon_code_bottom_sheet.dart';
class ReviewCartWidget extends StatelessWidget {

  final MyReviewController controller;

  const ReviewCartWidget({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15,vertical: Dimensions.space15),
              decoration: BoxDecoration(
                color: MyColor.colorLightGrey,
                borderRadius: BorderRadius.circular(Dimensions.space6),
              ),
              child: Image.asset(MyImages.watch),
            ),
            const SizedBox(width: Dimensions.space16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(MyImages.clock),
                    const SizedBox(width: Dimensions.space3,),
                    Text(MyStrings.purchasedOn,style: regularDefaultInter.copyWith(color: MyColor.contentTextColor,fontSize: Dimensions.space10)),
                  ],
                ),
                const SizedBox(height: Dimensions.space8),
                Text(MyStrings.highTemperature.tr,style: regularDefaultInter.copyWith(fontWeight: FontWeight.w500,color: MyColor.primaryTextColor)),
                const SizedBox(height: Dimensions.myReviewContentSpace),
                Row(
                  children: [
                    Text(MyStrings.soldBy,style: regularDefaultInter.copyWith(color: MyColor.contentTextColor)),
                    Text(MyStrings.mazumderIt.tr,style: regularDefaultInter.copyWith(color: MyColor.primaryColor))
                  ],
                )
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: () {
                CustomBottomSheet(
                    child: GetBuilder<MyReviewController>(builder: (controller)=>SubmitReviewBottomSheet(controller: controller))
                ).customBottomSheet(context);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.space6,vertical: Dimensions.space6),
                decoration: BoxDecoration(
                  color: MyColor.iconsBackground,
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Row(
                  children: [
                    const Icon(Icons.star,size: Dimensions.space11,color: MyColor.primaryColor,),
                    Text(" ${MyStrings.review}",style: regularDefaultInter.copyWith(color: MyColor.primaryColor,fontSize: Dimensions.space12,fontWeight: FontWeight.w500),)
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: Dimensions.space15),
          height: 1,
          width: double.maxFinite,
          color: MyColor.colorLightGrey,
        )
      ],
    );
  }
}

