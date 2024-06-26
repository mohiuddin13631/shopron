import 'package:flutter/material.dart';
import 'package:shopron/domain/controller/check_out/check_out_controller.dart';
import 'package:shopron/presentation/components/checkbox/circular_check_box.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_images.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/product_details/product_details_controller.dart';
import '../../../components/bottom-sheet/bottom_sheet_header_row.dart';
import '../../../components/buttons/custom_rounded_button.dart';
class OnlinePaymentBottomSheet extends StatelessWidget {

  final CheckOutController  controller;

  const OnlinePaymentBottomSheet({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BottomSheetHeaderRow(
          header: MyStrings.onlinePayment.tr,
          bottomSpace: Dimensions.space22,
        ),
        Column(
          children: List.generate(controller.paymentMethode.length, (index) => InkWell(
            onTap: () {
              controller.setPaymentMethode(index);
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: Dimensions.space16),
              child: Row(
                children: [
                  Text(controller.paymentMethode[index],style: regularDefaultInter.copyWith(color: MyColor.labelTextColor),),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(Dimensions.space4),
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(
                      color: controller.currentPayment == index ? MyColor.primaryColor : null,
                      border: controller.currentPayment != index ? Border.all(color: MyColor.colorGrey.withOpacity(.6),width: 1): null,
                      shape: BoxShape.circle
                    ),
                    child: controller.currentPayment == index ? SvgPicture.asset(MyImages.check):const SizedBox.shrink(),
                  )
                ],
              ),
            ),
          )),
        ),
        CustomRoundedButton(
          press: () {
            Get.back();
          },
          verticalPadding: 12,
          labelName: MyStrings.apply.tr,
          isHorizontalPadding: false,
        )
      ],
    );
  }
}