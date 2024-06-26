import 'package:flutter/material.dart';
import 'package:shopron/config/route/route.dart';
import 'package:shopron/presentation/screens/my_cart/widget/coupon_code_bottom_sheet.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/my_cart/my_cart_controller.dart';
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
                bgColor: MyColor.primaryColor,
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