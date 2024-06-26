
import 'package:flutter/material.dart';
import 'package:shopron/config/route/route.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/config/utils/my_images.dart';
import 'package:shopron/config/utils/my_strings.dart';
import 'package:shopron/domain/controller/my_cart/my_cart_controller.dart';
import 'package:shopron/domain/product/my_product.dart';
import 'package:shopron/presentation/components/app-bar/custom_appbar.dart';
import 'package:shopron/presentation/screens/my_cart/widget/bottom_section.dart';
import 'package:shopron/presentation/screens/my_cart/widget/cart_widget.dart';
import 'package:shopron/presentation/screens/my_cart/widget/slide_menu.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../config/utils/dimensions.dart';
import '../../../config/utils/style.dart';
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
          title: Text(MyStrings.myCart.tr,style: titleText,),
          leading: widget.isShowBackButton ? IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Get.back();
              },
              icon: SvgPicture.asset(MyImages.backButton)
          ) : null,
          automaticallyImplyLeading: false,
        ),
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: MyProduct.mixProductList.length,
          itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(RouteHelper.productDetailsScreen);
            },
            child: SlideMenu(
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
                  title: CartWidget(controller: controller,productModel: MyProduct.mixProductList[index],),
                ),
              ),
            ),
          );
        },),
        bottomNavigationBar: widget.isShowBackButton ? BottomSection(controller: controller) : const SizedBox.shrink()
      ),
    );
  }
}






