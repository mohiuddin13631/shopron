import 'package:flutter/material.dart';
import 'package:flutter_prime/view/screens/my_cart/widget/quantity_button.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_images.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../core/utils/style.dart';
import '../../../../data/controller/my_cart/my_cart_controller.dart';
import '../../../components/divider/horizontal_divider.dart';
class CartWidget extends StatelessWidget {

  final MyCartController controller;

  const CartWidget({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            Text(MyStrings.cartHeaderText,style: semiBoldDefault.copyWith(color: MyColor.primaryTextColor.withOpacity(.8),fontFamily: "Open Sans",fontSize: 13),),
            const SizedBox(height: Dimensions.cardContentSpace),
            Row(
              children: [
                Text("${MyStrings.color.tr} : ${MyStrings.red.tr}",style: regularSmall.copyWith(color: MyColor.primaryTextColor.withOpacity(.7))),
                const HorizontalDivider(),
                Text("${MyStrings.size.tr} : ${controller.productSize}",style: regularSmall.copyWith(color: MyColor.primaryTextColor.withOpacity(.7))),
              ],
            ),
            const SizedBox(height: Dimensions.cardContentSpace),
            Text("\$${controller.productPrice} x ${controller.quantity}",style: semiBoldLarge,)
          ],
        ),
        const Spacer(),
        Row(
          children: [
            QuantityButton(
              controller: controller,
              icon: Icons.remove,
              press: () => controller.decreaseQuantity(),
            ),
            const SizedBox(width: Dimensions.space12,),
            Text("${controller.quantity}",style: semiBoldLarge,),
            const SizedBox(width: Dimensions.space12,),
            QuantityButton(
              press: () => controller.increaseQuantity(),
              controller: controller,
              icon: Icons.add,
              bgColor: MyColor.primaryColor,
              iconColor: MyColor.colorWhite,
            ),
          ],
        )
      ],
    );
  }
}

