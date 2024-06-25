import 'package:flutter/material.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_images.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/data/controller/home/home_controller.dart';
import 'package:flutter_prime/data/product/my_product.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar_mab.dart';
import 'package:flutter_prime/view/components/divider/custom_divider.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/category_section.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/custom_product_section.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/custom_row_header.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/custom_slider.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/product_card.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/rating_widget.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/summer_offer_heading.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/top_brand_section.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/visible_icon.dart';
import 'package:get/get.dart';

import '../../../../core/utils/style.dart';
import 'widget/custom_drawer.dart';


class HomeScreen extends StatefulWidget {

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    final controller = Get.put(HomeController());
    super.initState();
  }

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return GetBuilder<HomeController>(
      builder: (controller) =>Scaffold(
        key: scaffoldKey,
        drawer: const CustomDrawer(),
          appBar: CustomAppBarWithMAB(
            title: MyStrings.appName,
            isShowBackBtn: true,
            isTitleCenter: true,
            leadingImage: MyImages.drawer,
            actionImage1: MyImages.search,
            actionImage2: MyImages.favorite,
            leadingDrawer: true, //if i use it
            drawerClick: () => scaffoldKey.currentState?.openDrawer(),
            actionPress1: () {},
            actionPress2: () {
              Get.toNamed(RouteHelper.wishListScreen);
            },
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                const SizedBox(height: 10,),
                CustomSlider(bannerList: controller.imageList),
                const CategorySection(),
                const CustomDivider(space: 2,),
                CustomProductSection(
                  controller: controller,
                  productType: MyStrings.featuredProduct.tr,
                  productList: MyProduct.watchList,
                ),
                const CustomDivider(space: 5,),
                Image.asset(MyImages.headphoneBanner,fit: BoxFit.cover, width: double.maxFinite,height: 150,),
                const CustomDivider(space: 5,),
                SummerOfferHeading(controller: controller),
                ProductList(controller: controller,productList: MyProduct.watchList,),
                const CustomDivider(space: 2,),
                CustomProductSection(
                  productList: MyProduct.watchList,
                  controller: controller,
                  productType: MyStrings.topSellingProduct.tr,
                  enableDiscount: true,
                ),
                const CustomDivider(space: 5,),
                SizedBox(
                  height: Dimensions.space145,
                  width: double.maxFinite,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: Dimensions.space8),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Dimensions.cardRadius),
                          child: Image.asset(MyImages.headphoneBanner),
                        ),
                      );
                    },
                  ),
                ),
                const CustomDivider( space: 10,), //todo
                CustomRowHeader(title: MyStrings.topBrand,viewAllPress: () {Get.toNamed(RouteHelper.topBrandScreen);},),
                const TopBrandSection(),
                const CustomDivider(space: 2,),
                CustomProductSection(
                  productList: MyProduct.watchList,
                  controller: controller,
                  productType: MyStrings.latestProduct.tr,
                ),
                const CustomDivider(space: 2,),
                const CategorySection(categoryType: MyStrings.topCategory),
                const CustomDivider(space: 2,),
                CustomRowHeader(title: MyStrings.trendingProduct.tr,viewAllPress: () {}),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.space8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10),
                    itemCount: MyProduct.mensFashionList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () => Get.toNamed(RouteHelper.productDetailsScreen),
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: Dimensions.space8),
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          width: 146,
                          decoration: BoxDecoration(
                            color: MyColor.colorWhite,
                            border: Border.all(color: MyColor.borderColor,width: .7),
                            // color:  controller.visibleIndex == index?MyColor.colorGrey.withOpacity(.5) : MyColor.colorLightGrey,
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
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(MyProduct.mensFashionList[index].image,width: 70,height: 70,),
                                  const SizedBox(height: Dimensions.space8),
                                  Text(MyProduct.mensFashionList[index].title.tr,textAlign: TextAlign.center,),
                                  const SizedBox(height: Dimensions.space8),
                                  Image.asset(MyImages.lottoIcon),
                                  const SizedBox(height: Dimensions.space8,),
                                  controller.visibleIndex == index? const SizedBox():
                                  CustomRatingWidget(controller: controller,isShowTotalRating: false,),
                                  const SizedBox(height: Dimensions.space8),
                                  controller.visibleIndex == index? const SizedBox.shrink():
                                  Text("\$${controller.productPrice}",style: semiBoldMediumLarge.copyWith()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                ),
                const SizedBox(height: Dimensions.space16,)
              ],
            ),
          ),
      )
    );
  }

}


















