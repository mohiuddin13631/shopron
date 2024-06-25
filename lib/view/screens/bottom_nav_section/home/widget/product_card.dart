import 'package:flutter/material.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/rating_widget.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/visible_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/my_color.dart';
import '../../../../../core/utils/my_images.dart';
import '../../../../../core/utils/my_strings.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../data/controller/home/home_controller.dart';
import '../../../../../data/product/my_product.dart';
class ProductList extends StatelessWidget {

  final HomeController controller;
  final bool enableDiscount;
  final List<ProductModel> productList;

  const ProductList({
    super.key,
    required this.controller,
    this.enableDiscount = false,
    required this.productList
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.only(left: Dimensions.space10 ),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(productList.length, (index) => InkWell(
              onTap: () {
                // controller.toggleVisibility(index);
               Get.toNamed(RouteHelper.productDetailsScreen);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: Dimensions.space8),
                padding: const EdgeInsets.all(Dimensions.space8),
                width: 146,
                decoration: BoxDecoration(
                  color:  controller.visibleIndex == index?MyColor.colorGrey.withOpacity(.5) : MyColor.colorLightGrey,
                  borderRadius: BorderRadius.circular(Dimensions.space7),
                ),
                child: Stack(
                  children: [
                    Visibility(
                      visible: controller.visibleIndex == index,
                      child: Positioned(
                        bottom:3,
                        left: 10,
                        child: Container(
                          padding: const EdgeInsets.all(Dimensions.space8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              VisibleIcon(svgImage: MyImages.favorite),
                              VisibleIcon(svgImage: MyImages.favorite),
                              VisibleIcon(svgImage: MyImages.favorite),
                            ],
                          ),
                        ),
                      ),
                    ),
                    enableDiscount? Positioned(
                      top: Dimensions.space12,
                      left: 0,
                      child: Container(
                        alignment: Alignment.center,
                        height: Dimensions.space14,
                        width: Dimensions.space35,
                        color: MyColor.primaryColor,
                        child: Text(MyStrings.offerText.tr,style: semiBoldDefault.copyWith(color: MyColor.colorWhite,fontSize: Dimensions.space8)),
                      ),
                    ):const SizedBox(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(productList[index].image,width: 100,height: 100,),
                        // const SizedBox(height: Dimensions.space8),
                        Text(productList[index].title,textAlign: TextAlign.center,),
                        const SizedBox(height: Dimensions.space8),
                        Image.asset(MyImages.lottoIcon),
                        const SizedBox(height: Dimensions.space8,),
                        controller.visibleIndex == index? const SizedBox():
                        CustomRatingWidget(controller: controller),
                        const SizedBox(height: Dimensions.space8,),
                        controller.visibleIndex == index? const SizedBox.shrink():
                        Text("\$${controller.productPrice}",style: semiBoldMediumLarge.copyWith()),
                      ],
                    ),
                  ],
                ),
              ),
            )),
          ),
        ),
        const SizedBox(height: Dimensions.space30,)
      ],
    );
  }
}

