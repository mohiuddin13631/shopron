import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/view/screens/menu/widget/menu_card.dart';
import 'package:flutter_prime/view/screens/menu/widget/menu_row_widget.dart';
import 'package:get/get.dart';

import '../../../core/route/route.dart';
import '../../../core/utils/my_images.dart';
import '../../../core/utils/my_strings.dart';
import '../../../core/utils/style.dart';
import '../../components/app-bar/custom_appbar.dart';
class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.colorLightGrey,
      appBar: AppBar(
        centerTitle: true,
        title: Text(MyStrings.myOrder.tr,style: titleText,),
      ),
      body: SingleChildScrollView(
        padding: Dimensions.screenPaddingHV,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MenuCard(
              child: Column(
                children: [
                  MenuRowWidget(
                    image: MyImages.person,
                    label: MyStrings.profile,
                    iconSize: 25,
                    onPressed: () => Get.toNamed(RouteHelper.profileScreen),
                  ),
                ],
              )
            ),

            const SizedBox(height: Dimensions.space15),

            MenuCard(
              child: Column(
                children: [
                  MenuRowWidget(
                    image: MyImages.lock,
                    label: MyStrings.changePassword.tr,
                    onPressed: () => Get.toNamed(RouteHelper.changePasswordScreen),
                  ),
                ],
              ),
            ),

            const SizedBox(height: Dimensions.space15),

            MenuCard(
              child: Column(
                children: [
                  MenuRowWidget(
                    image: MyImages.paymentLog,
                    label: MyStrings.paymentLog,
                    onPressed: () => Get.toNamed(RouteHelper.paymentLogScreen),
                  ),
                  MenuRowWidget(
                    image: MyImages.orderLog,
                    label: MyStrings.orderLog,
                    onPressed: () => Get.toNamed(RouteHelper.myOrderScreen),
                  ),
                ],
              ),
            ),

            const SizedBox(height: Dimensions.space15),

            MenuCard(
              child: Column(
                children: [
                  MenuRowWidget(
                    image: MyImages.notification,
                    label: MyStrings.myNotification.tr,
                    onPressed: () => Get.toNamed(RouteHelper.notificationScreen),
                  ),
                  MenuRowWidget(
                    image: MyImages.faq,
                    label: MyStrings.faq.tr,
                    onPressed: () => Get.toNamed(RouteHelper.faqScreen),
                  ),
                  MenuRowWidget(
                    image: MyImages.myReview,
                    label: MyStrings.myReview,
                    onPressed: () => Get.toNamed(RouteHelper.myReviewScreen),
                  ),
                ],
              ),
            ),

            const SizedBox(height: Dimensions.space15),

            MenuCard(
              child: Column(
                children: [

                  MenuRowWidget(
                    image: MyImages.signOut,
                    label: MyStrings.signOut,
                    onPressed: () => Get.offAllNamed(RouteHelper.loginScreen),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
