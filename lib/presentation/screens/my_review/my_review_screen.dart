import 'package:flutter/material.dart';
import 'package:shopron/config/utils/dimensions.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/domain/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:shopron/domain/controller/my_order/my_order_controller.dart';
import 'package:shopron/domain/controller/my_order/my_order_controller.dart';
import 'package:shopron/domain/controller/my_review/my_review_controller.dart';
import 'package:shopron/domain/controller/my_review/my_review_controller.dart';
import 'package:shopron/domain/controller/top_brand/top_brand_controller.dart';
import 'package:shopron/domain/product/my_product.dart';
import 'package:shopron/presentation/screens/my_review/widget/review_cart_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/route/route.dart';
import '../../../config/utils/my_images.dart';
import '../../../config/utils/my_strings.dart';
import '../../../domain/controller/my_cart/my_cart_controller.dart';
import '../../components/app-bar/custom_appbar_mab.dart';
class MyReviewScreen extends StatefulWidget {
  const MyReviewScreen({super.key});

  @override
  State<MyReviewScreen> createState() => _MyReviewScreenState();
}

class _MyReviewScreenState extends State<MyReviewScreen> {

  @override
  void initState() {
    final controller = Get.put(MyReviewController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MyReviewController>(
      builder: (controller) => Scaffold(
        backgroundColor: MyColor.backGroundScreenColor,
        appBar: CustomAppBarWithMAB(
          title: MyStrings.myReview,
          isShowBackBtn: true,
          leadingImage: MyImages.backButton,
          actionImage1: MyImages.search,
          actionImage2: MyImages.card,
          actionPress1: () {},
          actionPress2: () {
            Get.toNamed(RouteHelper.myCartScreen);
          },
        ),
        body: Container(
          margin: Dimensions.myReviewContainerMargin,
          padding: const EdgeInsets.symmetric(vertical: Dimensions.space17,horizontal: Dimensions.space15),
          decoration: BoxDecoration(
              color: MyColor.colorWhite,
            borderRadius: BorderRadius.circular(Dimensions.space9)
          ),
          child: ListView(
            children: List.generate(MyProduct.mixProductList.length, (index) => ReviewCartWidget(controller: controller,productModel: MyProduct.mixProductList[index],)),
          ),
        ),
      )
    );
  }
}
