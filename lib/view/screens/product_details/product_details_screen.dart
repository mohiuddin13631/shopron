import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/data/controller/product_details/product_details_controller.dart';
import 'package:flutter_prime/view/components/buttons/card_button.dart';
import 'package:flutter_prime/view/components/buttons/rounded_border_container.dart';
import 'package:flutter_prime/view/components/buttons/rounded_button.dart';
import 'package:flutter_prime/view/components/divider/custom_divider.dart';
import 'package:flutter_prime/view/components/text/body_text.dart';
import 'package:flutter_prime/view/components/text/header_text.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/rating_widget.dart';
import 'package:flutter_prime/view/screens/product_details/widget/custom_rich_text.dart';
import 'package:flutter_prime/view/screens/product_details/widget/discount_text_widget.dart';
import 'package:flutter_prime/view/screens/product_details/widget/heading_section.dart';
import 'package:flutter_prime/view/screens/product_details/widget/pd_top_section.dart';
import 'package:flutter_prime/view/screens/product_details/widget/rating_widget.dart';
import 'package:flutter_prime/view/screens/product_details/widget/review_section.dart';
import 'package:flutter_prime/view/screens/product_details/widget/select_cds_section.dart';
import 'package:flutter_prime/view/screens/product_details/widget/sub_heading_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/my_images.dart';
import '../../../core/utils/my_strings.dart';
import '../../../data/product/my_product.dart';
import '../../components/app-bar/custom_appbar_mab.dart';
import '../../components/buttons/custom_rounded_button.dart';
import '../bottom_nav_section/home/widget/custom_product_section.dart';
import '../bottom_nav_section/home/widget/custom_row_header.dart';
import '../bottom_nav_section/home/widget/product_card.dart';
class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {

  @override
  void initState() {
    final controller = Get.put(ProductDetailsController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return GetBuilder<ProductDetailsController>(
      builder: (controller) => Scaffold(
        appBar: CustomAppBarWithMAB(
          title: MyStrings.appName,
          isShowBackBtn: true,
          leadingImage: MyImages.backButton,
          actionImage1: MyImages.search,
          actionImage2: MyImages.card,
          actionPress1: () {},
          actionPress2: () {
            Get.toNamed(RouteHelper.myCartScreen);
          },
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: Dimensions.space10),
              ProductDetailsTopSection(controller: controller),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Dimensions.screenPaddingH),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: Dimensions.space13),
                    HeadingSection(controller: controller),
                    const CustomDivider(dividerHeight: 2),
                    SelectColorDesignSizeSection(controller: controller),
                    const CustomDivider(),
                    const SubHeadingText(text: MyStrings.overView),
                    BodyText(text: controller.overViewText),
                    const CustomDivider(),
                    const SubHeadingText(text: MyStrings.specifications,bottomSpacing: Dimensions.space8),
                    CustomRichText(title: MyStrings.brand,subTitle: MyStrings.beta.tr),
                    CustomRichText(title: MyStrings.mainMaterial,subTitle: MyStrings.puLather.tr),
                    CustomRichText(title: MyStrings.menShoesClosure,subTitle: MyStrings.signUpAndPullOn.tr),
                    const CustomDivider(),
                    const SubHeadingText(text: MyStrings.review,bottomSpacing: Dimensions.space15),
                    ReviewSection(controller: controller),
                  ],
                ),
              ),
              CustomProductSection(
                productList: MyProduct.watchList,
                controller: controller.homeController,
                productType: MyStrings.relatedProduct,
                enableDiscount: true,
              ),
            ],
          ),
        ),
          bottomNavigationBar: CustomRoundedButton(
            verticalPadding: 14,
            labelName: MyStrings.addToCart,
            svgImage: MyImages.cartIcon,
            press: () {
              Get.toNamed(RouteHelper.myCartScreen);
            },
          ),
      ),
    );
  }
}
















