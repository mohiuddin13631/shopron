import 'package:flutter/material.dart';
import 'package:shopron/config/utils/dimensions.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/config/utils/style.dart';
import 'package:shopron/domain/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:shopron/domain/controller/payment_log/payment_log_controller.dart';
import 'package:shopron/domain/controller/payment_log/payment_log_controller.dart';
import 'package:shopron/domain/controller/top_brand/top_brand_controller.dart';
import 'package:shopron/presentation/components/card/custom_card.dart';
import 'package:shopron/presentation/components/divider/horizontal_divider.dart';
import 'package:shopron/presentation/screens/payment_log/widget/payment_log_cart.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/route/route.dart';
import '../../../config/utils/my_images.dart';
import '../../../config/utils/my_strings.dart';
import '../../../domain/controller/my_cart/my_cart_controller.dart';
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
              Get.toNamed(RouteHelper.myCartScreen);
            },
          ),
          body: ListView(
            children: List.generate(12, (index) => PaymentLogCart(controller: controller)),
          ),
        )
    );
  }
}


