
import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_images.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/data/controller/my_cart/my_cart_controller.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:flutter_prime/view/screens/my_cart/widget/bottom_section.dart';
import 'package:flutter_prime/view/screens/my_cart/widget/cart_widget.dart';
import 'package:flutter_prime/view/screens/my_cart/widget/slide_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/utils/dimensions.dart';
import '../../../core/utils/style.dart';
class MyCartScreen extends StatefulWidget {

  final bool isShowBackButton;

  const MyCartScreen({super.key,this.isShowBackButton = true});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {

  @override
  void initState() {
    final controller = Get.put(MyCartController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MyCartController>(
      builder: (controller) => Scaffold(
        backgroundColor: MyColor.colorLightGrey,
        appBar: AppBar(
          centerTitle: true,
          title: Text(MyStrings.myOrder.tr,style: titleText,),
          leading: widget.isShowBackButton ? IconButton(
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(MyImages.backButton)
          ) : null,
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
          return SlideMenu(
            swipeContentWidth: 0.15,
            menuItems: <Widget>[
              GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset(MyImages.delete,width: Dimensions.space20)
              ),
            ],
            child: Container(
              color: MyColor.colorWhite,
              margin: const EdgeInsets.only(bottom: Dimensions.space10),
              child: ListTile(
                contentPadding: Dimensions.lisTilePaddingHV,
                title: CartWidget(controller: controller),
              ),
            ),
          );
        },),
        bottomNavigationBar: widget.isShowBackButton ? BottomSection(controller: controller) : const SizedBox.shrink()
      ),
    );
  }
}






