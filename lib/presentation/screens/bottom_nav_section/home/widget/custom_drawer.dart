import 'package:flutter/material.dart';
import 'package:shopron/config/route/route.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../config/utils/dimensions.dart';
import '../../../../../config/utils/my_color.dart';
import '../../../../../config/utils/my_images.dart';
import '../../../../../config/utils/my_strings.dart';
import '../../../../../config/utils/style.dart';
import '../../../../components/image/circle_shape_image.dart';
import 'dreawer_item_widget.dart';
class CustomDrawer extends StatelessWidget {

  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        width: Dimensions.drawerWidth,
        height: double.maxFinite,
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              padding: Dimensions.drawerPaddingHV,
              decoration: const BoxDecoration(
                color: MyColor.primaryColor,
              ),
              child: Row(
                children: [
                  const CircleShapeImage( image: MyImages.profile,),
                  const SizedBox(width: Dimensions.space13,),
                  Text(
                    "User name",
                    style: semiBoldLargeInter.copyWith(color: MyColor.colorWhite),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * .03,),
            DrawerItem(
              title: MyStrings.myProfile,
              svgIcon: MyImages.person,
              press: (){
                Get.toNamed(RouteHelper.profileScreen);
              },
            ),
            DrawerItem(
              title: MyStrings.paymentLog,
              svgIcon: MyImages.paymentLog,
              press: (){
                Get.toNamed(RouteHelper.paymentLogScreen);
              },
            ),
            DrawerItem(
              title: MyStrings.orderLog,
              svgIcon: MyImages.orderLog,
              press: (){
                Get.toNamed(RouteHelper.myOrderScreen);
              },
            ),
            DrawerItem(
              title: MyStrings.myReview,
              svgIcon: MyImages.myReview,
              press: (){
                Get.toNamed(RouteHelper.myReviewScreen);
              },
            ),

            DrawerItem(
              title: MyStrings.myNotification,
              svgIcon: MyImages.notification,
              press: (){
                Get.toNamed(RouteHelper.notificationScreen);
              },
            ),

            DrawerItem(
              title: MyStrings.faq,
              svgIcon: MyImages.faq,
              press: (){
                Get.toNamed(RouteHelper.faqScreen);
              },
            ),

            DrawerItem(
              title: MyStrings.signOut,
              svgIcon: MyImages.signOut,
              press: (){
                Get.offAllNamed(RouteHelper.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}