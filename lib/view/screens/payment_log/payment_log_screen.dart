import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/data/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:flutter_prime/data/controller/payment_log/payment_log_controller.dart';
import 'package:flutter_prime/data/controller/payment_log/payment_log_controller.dart';
import 'package:flutter_prime/data/controller/top_brand/top_brand_controller.dart';
import 'package:flutter_prime/view/components/card/custom_card.dart';
import 'package:flutter_prime/view/components/divider/horizontal_divider.dart';
import 'package:flutter_prime/view/screens/payment_log/widget/payment_log_cart.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/route/route.dart';
import '../../../core/utils/my_images.dart';
import '../../../core/utils/my_strings.dart';
import '../../../data/controller/my_cart/my_cart_controller.dart';
import '../../components/app-bar/custom_appbar_mab.dart';
class PaymentLogScreen extends StatefulWidget {
  const PaymentLogScreen({super.key});

  @override
  State<PaymentLogScreen> createState() => _PaymentLogScreenState();
}

class _PaymentLogScreenState extends State<PaymentLogScreen> {

  @override
  void initState() {
    final controller = Get.put(PaymentLogController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<PaymentLogController>(
        builder: (controller) => Scaffold(
          backgroundColor: MyColor.backGroundScreenColor,
          appBar: CustomAppBarWithMAB(
            title: MyStrings.paymentLog,
            isShowBackBtn: true,
            leadingImage: MyImages.backButton,
            actionImage1: MyImages.search,
            actionImage2: MyImages.card,
            actionPress1: () {},
            actionPress2: () {
              Get.toNamed(RouteHelper.bottomNavBar);
            },
          ),
          body: ListView(
            children: List.generate(12, (index) => PaymentLogCart(controller: controller)),
          ),
        )
    );
  }
}


