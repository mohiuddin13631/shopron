import 'package:flutter/material.dart';
import 'package:shopron/presentation/screens/product_details/widget/rating_widget.dart';
import 'package:get/get.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/product_details/product_details_controller.dart';
import '../../../components/text/header_text.dart';
import 'discount_text_widget.dart';
class HeadingSection extends StatelessWidget {

  final ProductDetailsController controller;

  const HeadingSection({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            HeaderText(text: MyStrings.manSneakers.tr,textStyle: semiBoldOverLarge.copyWith(fontSize: Dimensions.fontExtraLarge,fontFamily: "Inter")),
            const Spacer(),
            CustomRatingWidgetForPd(controller: controller),
          ],
        ),
        const SizedBox(height: Dimensions.space4,),
        Row(
          children: [
            Text("\$${controller.productPrice()}",style: semiBoldOverLarge.copyWith(fontSize: Dimensions.fontSemeLarge)),
            DiscountTextWidget(controller: controller),
            const SizedBox(width: Dimensions.space5),
            Text("${MyStrings.inStock.tr}(${controller.totalStock})",style: mediumDefault.copyWith(color: MyColor.stockTextColor)),
            const SizedBox(height: Dimensions.space14),
            const SizedBox(height: Dimensions.space14),
          ],
        ),
      ],
    );
  }
}