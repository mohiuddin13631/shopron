import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shopron/config/route/route.dart';
import 'package:shopron/domain/controller/my_review/my_review_controller.dart';
import 'package:shopron/domain/product/my_product.dart';
import 'package:shopron/presentation/screens/my_cart/widget/quantity_button.dart';
import 'package:shopron/presentation/screens/my_review/widget/submit_review_bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_images.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/my_cart/my_cart_controller.dart';
import '../../../components/bottom-sheet/custom_bottom_sheet.dart';
import '../../../components/divider/horizontal_divider.dart';
import '../../my_cart/widget/coupon_code_bottom_sheet.dart';
class ReviewCartWidget extends StatelessWidget {

  final MyReviewController controller;
  final ProductModel productModel;

  const ReviewCartWidget({
    super.key,
    required this.controller,
    required this.productModel
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Row(
          children: [

            GestureDetector(
              onTap: () => Get.toNamed(RouteHelper.productDetailsScreen),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: Dimensions.space4,vertical: Dimensions.space4),
                    decoration: BoxDecoration(
                      color: MyColor.colorLightGrey,
                      borderRadius: BorderRadius.circular(Dimensions.space6),
                    ),
                    child: Image.asset(productModel.image,width: 80,height: 80,),
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
                ],
              ),
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

