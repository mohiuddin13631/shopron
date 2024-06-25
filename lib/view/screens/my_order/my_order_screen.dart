import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/data/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:flutter_prime/data/controller/my_order/my_order_controller.dart';
import 'package:flutter_prime/data/controller/my_order/my_order_controller.dart';
import 'package:flutter_prime/data/controller/top_brand/top_brand_controller.dart';
import 'package:flutter_prime/view/components/popscope_widget.dart';
import 'package:flutter_prime/view/screens/my_order/widget/my_order_cart.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/route/route.dart';
import '../../../core/utils/my_images.dart';
import '../../../core/utils/my_strings.dart';
import '../../../data/controller/my_cart/my_cart_controller.dart';
import '../../components/app-bar/custom_appbar.dart';
import '../../components/app-bar/custom_appbar_mab.dart';
class MyOrderScreen extends StatefulWidget {

  final String customRoute;
  final bool isShowBackButton;

  const MyOrderScreen({super.key, this.customRoute = "", this.isShowBackButton = true});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {

  @override
  void initState() {
    final controller = Get.put(MyOrderController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<MyOrderController>(
        builder: (controller) => PopScopeWidget(
          customPop: () {
            if(widget.customRoute.isNotEmpty){
              Get.offAllNamed(widget.customRoute);
            }
          },

          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(MyStrings.myOrder.tr,style: titleText,),
              leading: widget.isShowBackButton ? IconButton(
                onPressed: () {
                  if(widget.customRoute.isNotEmpty){
                    Get.offAllNamed(widget.customRoute);
                  }else{
                    Get.back();
                  }
                },
                icon: SvgPicture.asset(MyImages.backButton)
              ) : null,
            ),
            body: ListView.builder(
              shrinkWrap: true,
              itemCount: 12,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => Get.toNamed(RouteHelper.trackOrderScreen),
                    child: MyOrderCart(controller: controller));
              },
            ),
          ),
        )
    );
  }
}
