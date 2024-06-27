import 'package:flutter/material.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/config/utils/my_images.dart';
import 'package:shopron/config/utils/my_strings.dart';
import 'package:shopron/domain/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:shopron/domain/controller/top_brand/top_brand_controller.dart';
import 'package:shopron/domain/product/my_product.dart';
import 'package:shopron/presentation/components/app-bar/custom_appbar.dart';
import 'package:shopron/presentation/components/checkbox/circular_check_box.dart';
import 'package:shopron/presentation/components/divider/custom_divider.dart';
import 'package:shopron/presentation/screens/mens_fashion/widget/brand_section.dart';
import 'package:shopron/presentation/screens/mens_fashion/widget/color_section.dart';
import 'package:shopron/presentation/screens/mens_fashion/widget/custom_check_box_circular.dart';
import 'package:shopron/presentation/screens/mens_fashion/widget/custom_filter_section.dart';
import 'package:shopron/presentation/screens/mens_fashion/widget/custom_search_field.dart';
import 'package:shopron/presentation/screens/mens_fashion/widget/mens_fashion_rating_bar.dart';
import 'package:shopron/presentation/screens/mens_fashion/widget/mens_fashion_section.dart';
import 'package:shopron/presentation/screens/mens_fashion/widget/price_range_section.dart';
import 'package:shopron/presentation/screens/mens_fashion/widget/search_bar_section.dart';
import 'package:shopron/presentation/screens/mens_fashion/widget/size_section.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/route/route.dart';
import '../../../config/utils/dimensions.dart';
import '../../../config/utils/style.dart';
import '../bottom_nav_section/home/widget/visible_icon.dart';
class CategoryDetailsScreen extends StatefulWidget {

  final ProductModel category;

  const CategoryDetailsScreen({super.key, required this.category});

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {


  @override
  void initState() {
    final controller = Get.put(MensFashionController(category: widget.category));
    controller.loadCategory();
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
            title: widget.category.title,
            isShowBackBtn: true,
            isTitleCenter: true,
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
                      itemCount: controller.categoryList.length,
                      shrinkWrap: true,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,crossAxisSpacing: Dimensions.space16,mainAxisSpacing: Dimensions.space10,childAspectRatio: .75),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.productDetailsScreen);
                        },
                        child: Container(
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
                              index < 3 ?Positioned(
                                top: 8,
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
                                    Image.asset(MyProduct.mixProductList[index].image,width: 110,height: 110,),

                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          // Text("Dorothy Perkins",style: regularExtraSmall.copyWith(color: MyColor.naturalDark2),),
                                          Text(MyProduct.mixProductList[index].title,textAlign: TextAlign.center,style: boldLarge.copyWith(color: MyColor.colorBlack,fontSize: 15),),
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








