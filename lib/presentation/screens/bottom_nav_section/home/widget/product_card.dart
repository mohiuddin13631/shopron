import 'package:flutter/material.dart';
import 'package:shopron/config/route/route.dart';
import 'package:shopron/presentation/screens/bottom_nav_section/home/widget/rating_widget.dart';
import 'package:shopron/presentation/screens/bottom_nav_section/home/widget/visible_icon.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../../config/utils/dimensions.dart';
import '../../../../../config/utils/my_color.dart';
import '../../../../../config/utils/my_images.dart';
import '../../../../../config/utils/my_strings.dart';
import '../../../../../config/utils/style.dart';
import '../../../../../domain/controller/home/home_controller.dart';
import '../../../../../domain/product/my_product.dart';
class ProductList extends StatelessWidget {

  final HomeController controller;
  final bool enableDiscount;
  final List<ProductModel> productList;

  const ProductList({
    super.key,
    required this.controller,
    this.enableDiscount = true,
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(productList.length, (index){

              return GestureDetector(
                onTap: () {
                  // controller.toggleVisibility(index);
                  Get.toNamed(RouteHelper.productDetailsScreen);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: Dimensions.space8),
                  padding: const EdgeInsets.all(Dimensions.space8),
                  width: 146,
                  decoration: BoxDecoration(
                    color: MyColor.colorLightGrey,
                    borderRadius: BorderRadius.circular(Dimensions.space7),
                  ),
                  child: Stack(
                    children: [
                      Visibility(
                        visible: false,
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
                      index % 2 == 0 ? Positioned(
                        top: 0,
                        left: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          alignment: Alignment.center,
                          height: Dimensions.space14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: MyColor.redCancelTextColor,
                          ),
                          child: Text(MyStrings.offerText.tr,style: semiBoldDefault.copyWith(color: MyColor.colorWhite,fontSize: Dimensions.space8)),
                        ),
                      ):const SizedBox(),
                      SizedBox(
                        width: 146,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(productList[index].image,width: 110,height: 110,),

                            Align(
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Text("Dorothy Perkins",style: regularExtraSmall.copyWith(color: MyColor.naturalDark2),),
                                  Text(productList[index].title,textAlign: TextAlign.center,style: boldLarge.copyWith(color: MyColor.colorBlack,fontSize: 15),),
                                  Text("\$${controller.productPrice}",style: regularLarge.copyWith(fontSize: 13)),
                                  Row(
                                    children: [
                                      Row(
                                        children: List.generate(5, (index) => SvgPicture.asset(MyImages.star,width: 13,height: 13,),),
                                      ),
                                      Text(" (10)",style: regularSmall.copyWith(color: MyColor.naturalDark2),)
                                    ],
                                  ),
                                ],
                              ),
                            )


                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: Dimensions.space30,)
      ],
    );
  }
}

