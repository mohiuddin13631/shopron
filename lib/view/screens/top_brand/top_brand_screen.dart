import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/data/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:flutter_prime/data/controller/top_brand/top_brand_controller.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/widget/top_brand_section.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/route/route.dart';
import '../../../core/utils/my_images.dart';
import '../../../core/utils/my_strings.dart';
import '../../../data/controller/my_cart/my_cart_controller.dart';
import '../../components/app-bar/custom_appbar_mab.dart';
class TopBrandScreen extends StatefulWidget {
  const TopBrandScreen({super.key});

  @override
  State<TopBrandScreen> createState() => _TopBrandScreenState();
}

class _TopBrandScreenState extends State<TopBrandScreen> {

  @override
  void initState() {
    final controller = Get.put(TopBrandController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<TopBrandController>(
      builder: (controller) => Scaffold(
        appBar: CustomAppBarWithMAB(
          title: MyStrings.topBrand,
          isShowBackBtn: true,
          leadingImage: MyImages.backButton,
          actionImage1: MyImages.search,
          actionImage2: MyImages.card,
          actionPress1: () {},
          actionPress2: () {
            Get.toNamed(RouteHelper.myCartScreen);
          },
        ),
        body: const TopBrandSection(
          numberOfBrand: 16,
          topPadding: Dimensions.space14,
          rightPadding: Dimensions.space15,
        ),
      )
    );
  }
}
