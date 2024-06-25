import 'package:flutter/material.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/view/screens/my_cart/widget/coupon_code_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../core/utils/style.dart';
import '../../../../data/controller/my_cart/my_cart_controller.dart';
import '../../../components/bottom-sheet/custom_bottom_sheet.dart';
import '../../../components/buttons/rounded_border_container.dart';
class BottomSection extends StatelessWidget {

  final MyCartController controller;

  const BottomSection({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: Dimensions.myCartBottomPadding,
        child: Row(
          children: [
            InkWell(
              onTap: () {
                CustomBottomSheet(
                    child: GetBuilder<MyCartController>(builder: (controller)=>CouponCodeBottomSheet( controller: controller))
                ).customBottomSheet(context);
              },
              child: RoundedBorderContainer(
                text: MyStrings.applyCopun,
                bgColor: MyColor.colorLightGrey,
                borderColor: MyColor.colorGrey.withOpacity(.3),
                horizontalPadding: Dimensions.space10,
                verticalPadding: Dimensions.space8,
                borderWidth: 1,
              ),
            ),
            const Spacer(),
            Text("${MyStrings.subTotal} : \$${controller.subTotal}",style: semiBoldLargeInter.copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(width: Dimensions.space12),
            InkWell(
              onTap: () => Get.toNamed(RouteHelper.checkOutScreen),
              child: const RoundedBorderContainer(
                text: MyStrings.checkOut,
                textColor: MyColor.colorWhite,
                horizontalPadding: Dimensions.space7,
                verticalPadding: Dimensions.space7,
              ),
            )
          ],
        ),
      ),
    );
  }
}