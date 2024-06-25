import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/data/controller/wish_list/wish_list_controller.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar_mab.dart';
import 'package:flutter_prime/view/screens/wish_list/widget/wish_list_cart_widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/route/route.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/my_color.dart';
import '../../../core/utils/my_images.dart';
import '../../../data/controller/product_details/product_details_controller.dart';
import '../my_cart/widget/cart_widget.dart';
import '../my_cart/widget/slide_menu.dart';
class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  @override
  void initState() {
    final controller = Get.put(WishListController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<WishListController>(
      builder: (controller) => Scaffold(
        appBar: CustomAppBarWithMAB(
          title: MyStrings.wishList,
          isShowBackBtn: true,
          leadingImage: MyImages.backButton,
          actionImage1: MyImages.search,
          actionImage2: MyImages.card,
          actionPress2: () {Get.toNamed(RouteHelper.myCartScreen);},
        ),
        body: ListView(
          children: List.generate(10, (index) {
            return SlideMenu(
              swipeContentWidth: 0.3,
              menuItems: [
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(MyImages.delete,width: Dimensions.space20)
                ),
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(MyImages.card,width: Dimensions.space20,colorFilter: const ColorFilter.mode(MyColor.primaryColor, BlendMode.srcIn),)
                ),
                GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(MyImages.comparison,width: Dimensions.space20,colorFilter: const ColorFilter.mode(MyColor.iconColor, BlendMode.srcIn),)
                ),
              ],
              child: Container(
                color: MyColor.colorWhite,
                margin: const EdgeInsets.only(bottom: Dimensions.space10),
                child: ListTile(
                  contentPadding: Dimensions.lisTilePaddingHV,
                  title: WishListCartWidget(controller: controller),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
