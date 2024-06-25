import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_images.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/data/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:flutter_prime/data/controller/top_brand/top_brand_controller.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:flutter_prime/view/components/checkbox/circular_check_box.dart';
import 'package:flutter_prime/view/components/divider/custom_divider.dart';
import 'package:flutter_prime/view/screens/mens_fashion/widget/brand_section.dart';
import 'package:flutter_prime/view/screens/mens_fashion/widget/color_section.dart';
import 'package:flutter_prime/view/screens/mens_fashion/widget/custom_check_box_circular.dart';
import 'package:flutter_prime/view/screens/mens_fashion/widget/custom_filter_section.dart';
import 'package:flutter_prime/view/screens/mens_fashion/widget/custom_search_field.dart';
import 'package:flutter_prime/view/screens/mens_fashion/widget/mens_fashion_rating_bar.dart';
import 'package:flutter_prime/view/screens/mens_fashion/widget/mens_fashion_section.dart';
import 'package:flutter_prime/view/screens/mens_fashion/widget/price_range_section.dart';
import 'package:flutter_prime/view/screens/mens_fashion/widget/search_bar_section.dart';
import 'package:flutter_prime/view/screens/mens_fashion/widget/size_section.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/route/route.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/style.dart';
import '../bottom_nav_section/home/widget/visible_icon.dart';
class MensFashionScreen extends StatefulWidget {
  const MensFashionScreen({super.key});

  @override
  State<MensFashionScreen> createState() => _MensFashionScreenState();
}

class _MensFashionScreenState extends State<MensFashionScreen> {

  @override
  void initState() {
    final controller = Get.put(MensFashionController());
    super.initState();
  }

  // bool enableDiscount = false;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return GetBuilder<MensFashionController>(
        builder: (controller) => Scaffold(

          endDrawer: CustomFilterSection(controller: controller),
          key: controller.scaffoldKey,
          backgroundColor: MyColor.backGroundScreenColor,
          appBar: CustomAppBar(
            title: MyStrings.mensFashion,
            isShowBackBtn: true,
            leadingImage: MyImages.backButton,
            actionImage: MyImages.card,
            isShowSingleActionBtn: true,
            actionPress: () {Get.toNamed(RouteHelper.myCartScreen);},
          ),
          body: Column(
            children: [
              SearchBarSection(controller: controller),
              const SizedBox(height: Dimensions.space8,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: Dimensions.space16,right: Dimensions.space16,bottom: Dimensions.space14),
                  child: GridView.builder(
                    scrollDirection: Axis.vertical,
                      itemCount: 10,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: Dimensions.space16,mainAxisSpacing: Dimensions.space10),
                      itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space16),
                        decoration: BoxDecoration(
                          color: MyColor.colorWhite,
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
                                      borderRadius: BorderRadius.circular(Dimensions.space5)
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
                            controller.enableDiscount? Positioned(
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
                                Image.asset(MyImages.watch),
                                const SizedBox(height: Dimensions.space8),
                                Text(MyStrings.samsungGalaxyWatch.tr,textAlign: TextAlign.center),
                                const SizedBox(height: Dimensions.space8),
                                Image.asset(MyImages.lottoIcon),
                                const SizedBox(height: Dimensions.space8),
                                controller.visibleIndex == index? const SizedBox.shrink():
                                FashionRatingBar(controller: controller,),
                                const SizedBox(height: Dimensions.space8),
                                controller.visibleIndex == index? const SizedBox.shrink():
                                Text("\$${controller.productPrice}",style: semiBoldMediumLarge.copyWith()),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}








