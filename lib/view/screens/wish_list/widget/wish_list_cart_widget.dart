import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prime/data/controller/wish_list/wish_list_controller.dart';
import 'package:flutter_prime/view/screens/my_cart/widget/quantity_button.dart';
import 'package:flutter_prime/view/screens/wish_list/widget/rating_widget_for_wish_list.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_images.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../core/utils/style.dart';
import '../../../../data/controller/my_cart/my_cart_controller.dart';
class WishListCartWidget extends StatelessWidget {

  final WishListController controller;

  const WishListCartWidget({
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
            borderRadius: BorderRadius.circular(6),
          ),
          child: Image.asset(MyImages.cartHeadPhone),
        ),
        const SizedBox(width: Dimensions.space16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(MyStrings.cartHeaderText,style: semiBoldDefault.copyWith(color: MyColor.primaryTextColor.withOpacity(.8),fontFamily: "Open Sans",fontSize: 11),),
            const SizedBox(height: Dimensions.cardContentSpace),
            CustomRatingWidgetForWishList(controller: controller),
            const SizedBox(height: Dimensions.cardContentSpace),
            Text("\$${controller.productPrice}",style: semiBoldLarge,)
          ],
        ),
      ],
    );
  }
}