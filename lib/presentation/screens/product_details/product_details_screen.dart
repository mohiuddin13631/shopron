import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopron/config/route/route.dart';
import 'package:shopron/config/utils/dimensions.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/config/utils/style.dart';
import 'package:shopron/domain/controller/product_details/product_details_controller.dart';
import 'package:shopron/presentation/components/buttons/card_button.dart';
import 'package:shopron/presentation/components/buttons/rounded_border_container.dart';
import 'package:shopron/presentation/components/buttons/rounded_button.dart';
import 'package:shopron/presentation/components/divider/custom_divider.dart';
import 'package:shopron/presentation/components/text/body_text.dart';
import 'package:shopron/presentation/components/text/header_text.dart';
import 'package:shopron/presentation/screens/bottom_nav_section/home/widget/rating_widget.dart';
import 'package:shopron/presentation/screens/product_details/widget/custom_rich_text.dart';
import 'package:shopron/presentation/screens/product_details/widget/discount_text_widget.dart';
import 'package:shopron/presentation/screens/product_details/widget/heading_section.dart';
import 'package:shopron/presentation/screens/product_details/widget/pd_top_section.dart';
import 'package:shopron/presentation/screens/product_details/widget/rating_widget.dart';
import 'package:shopron/presentation/screens/product_details/widget/review_section.dart';
import 'package:shopron/presentation/screens/product_details/widget/select_cds_section.dart';
import 'package:shopron/presentation/screens/product_details/widget/sub_heading_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/utils/my_images.dart';
import '../../../config/utils/my_strings.dart';
import '../../../domain/product/my_product.dart';
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
              const ProductDetailsTopSection(),
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
                productList: MyProduct.mixProductList,
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
















