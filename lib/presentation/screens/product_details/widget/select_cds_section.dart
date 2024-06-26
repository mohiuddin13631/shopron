import 'package:flutter/material.dart';
import 'package:shopron/presentation/components/bottom-sheet/bottom_sheet_header_row.dart';
import 'package:shopron/presentation/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:shopron/presentation/components/buttons/custom_rounded_button.dart';
import 'package:shopron/presentation/screens/product_details/widget/select_color_bottom_sheet.dart';
import 'package:shopron/presentation/screens/product_details/widget/select_design_bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_images.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/product_details/product_details_controller.dart';
class SelectColorDesignSizeSection extends StatelessWidget {

  final ProductDetailsController controller;

  const SelectColorDesignSizeSection({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      builder: (productDetailsController) {
        return  Row(
          children: [
            GestureDetector(
              onTap: () {
                CustomBottomSheet(
                    child: GetBuilder<ProductDetailsController>(builder: (controller)=>SelectColorBottomSheet(controller: controller,))
                ).customBottomSheet(context);
              },
              child: Row(
                children: [
                  Text("${MyStrings.color.tr} :",style: semiBoldOverLarge.copyWith(fontSize: 14),),
                  const SizedBox(width: Dimensions.space7),
                  const CircleAvatar(
                    radius: Dimensions.dropDownCircleRadius,
                    backgroundColor: MyColor.primaryColor,
                  ),
                  const Icon(Icons.expand_more,size: Dimensions.expandIconSize,),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: Dimensions.space12),
              width: Dimensions.horizontalDividerWidth,
              height: Dimensions.horizontalDividerHeight,
              color: MyColor.colorGrey,
            ),
            InkWell(
              onTap: () {
                CustomBottomSheet(
                    child: GetBuilder<ProductDetailsController>(builder: (controller)=>SelectDesignBottomSheet( controller: controller,))
                ).customBottomSheet(context);
              },
              child: Row(
                children: [
                  Text("${MyStrings.design.tr} :",style: semiBoldOverLarge.copyWith(fontSize: 14),),
                  const SizedBox(width: Dimensions.space7),
                  const CircleAvatar(
                    radius: Dimensions.dropDownCircleRadius,
                    backgroundImage: AssetImage(MyImages.carousel),
                  ),
                  const Icon(Icons.expand_more,size: Dimensions.expandIconSize,),
                ],
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Text("${MyStrings.size.tr}:",style: semiBoldOverLarge.copyWith(fontSize: 14),),
                const SizedBox(width: Dimensions.space5),
                Text(productDetailsController.homeController.productSize[0].toString()),
              ],
            )
          ],
        );
      },
    );
  }
}

