import 'package:flutter/material.dart';
import 'package:shopron/config/route/route.dart';
import 'package:shopron/config/utils/dimensions.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/config/utils/my_images.dart';
import 'package:shopron/config/utils/my_strings.dart';
import 'package:shopron/domain/controller/home/home_controller.dart';
import 'package:shopron/domain/product/my_product.dart';
import 'package:shopron/presentation/components/app-bar/custom_appbar_mab.dart';
import 'package:shopron/presentation/components/divider/custom_divider.dart';
import 'package:shopron/presentation/screens/bottom_nav_section/home/widget/category_section.dart';
import 'package:shopron/presentation/screens/bottom_nav_section/home/widget/custom_product_section.dart';
import 'package:shopron/presentation/screens/bottom_nav_section/home/widget/custom_row_header.dart';
import 'package:shopron/presentation/screens/bottom_nav_section/home/widget/custom_slider.dart';
import 'package:shopron/presentation/screens/bottom_nav_section/home/widget/product_card.dart';
import 'package:shopron/presentation/screens/bottom_nav_section/home/widget/rating_widget.dart';
import 'package:shopron/presentation/screens/bottom_nav_section/home/widget/summer_offer_heading.dart';
import 'package:shopron/presentation/screens/bottom_nav_section/home/widget/top_brand_section.dart';
import 'package:shopron/presentation/screens/bottom_nav_section/home/widget/visible_icon.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../config/utils/style.dart';
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
                const SizedBox(height: 5,),
                CustomSlider(bannerList: MyProduct.bannerList),
                const CategorySection(),
                const CustomDivider(space: 2,),
                CustomProductSection(
                  controller: controller,
                  productType: MyStrings.featuredProduct.tr,
                  productList: MyProduct.mixProductList,
                ),
                const CustomDivider(space: 5,),
                Image.asset(MyImages.banner_6,fit: BoxFit.contain, width: double.maxFinite,height: 200,),
                const CustomDivider(space: 5,),
                SummerOfferHeading(controller: controller),
                ProductList(controller: controller,productList: MyProduct.mixProductList.reversed.toList(),),
                const CustomDivider(space: 2,),
                CustomProductSection(
                  productList: MyProduct.mixProductList,
                  controller: controller,
                  productType: MyStrings.topSellingProduct.tr,
                  enableDiscount: true,
                ),
                const CustomDivider( space: 2,), //todo
                CustomRowHeader(title: MyStrings.topBrand,viewAllPress: () {Get.toNamed(RouteHelper.topBrandScreen);},),
                const TopBrandSection(),
                const CustomDivider(space: 2,),
                CustomProductSection(
                  productList: MyProduct.mixProductList.reversed.toList(),
                  controller: controller,
                  productType: MyStrings.latestProduct.tr,
                ),
                const CustomDivider(space: 2,),
                const CategorySection(categoryType: MyStrings.topCategory),
                const CustomDivider(space: 2,),
                CustomRowHeader(title: MyStrings.trendingProduct.tr,viewAllPress: () {}),
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.space8),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,childAspectRatio: .9),
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


















