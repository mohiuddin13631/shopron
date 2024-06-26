import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shopron/domain/controller/wish_list/wish_list_controller.dart';
import 'package:shopron/domain/product/my_product.dart';
import 'package:shopron/presentation/screens/my_cart/widget/quantity_button.dart';
import 'package:shopron/presentation/screens/wish_list/widget/rating_widget_for_wish_list.dart';
import 'package:get/get.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_images.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/my_cart/my_cart_controller.dart';
class WishListCartWidget extends StatelessWidget {

  final WishListController controller;
  final ProductModel productModel;

  const WishListCartWidget({
    super.key,
    required this.controller,
    required this.productModel
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space4,vertical: Dimensions.space4),
          decoration: BoxDecoration(
            color: MyColor.colorLightGrey,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Image.asset(productModel.image,width: 80,height: 80,),
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