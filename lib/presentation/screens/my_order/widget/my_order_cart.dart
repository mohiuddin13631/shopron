import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:shopron/domain/controller/my_order/my_order_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_images.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/payment_log/payment_log_controller.dart';
import '../../../components/divider/horizontal_divider.dart';
class MyOrderCart extends StatelessWidget {

  final MyOrderController controller;

  const MyOrderCart({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: Dimensions.paymentLogCartPadding,
      margin: const EdgeInsets.only(bottom:Dimensions.space5),
      color: MyColor.colorWhite,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("\$${controller.transectionId}",style: boldLarge),
              const Spacer(),
              const Icon(Icons.more_vert,color: MyColor.iconColor),
            ],
          ),
          const SizedBox(height: Dimensions.paymentLogContentHeight),
          Text("${MyStrings.products} : ${controller.productAmount}",style: regularDefault),
          const SizedBox(height: Dimensions.paymentLogContentHeight),
          Row(
            children: [
              SvgPicture.asset(MyImages.paid),
              const SizedBox(width: Dimensions.space3),
              Text(MyStrings.paid.tr,style: regularSmall.copyWith(color: MyColor.paidContentColor)),
              const Spacer(),
              Text(
                controller.orderStatus[0],style: semiBoldDefault.copyWith(color: controller.orderStatus[0] == "Delivery"?MyColor.deliveryTextColor
                :controller.orderStatus[1] == "Canceled"?MyColor.canceledTextColor
                :MyColor.inProgressTextColor)
              )
            ],
          )
        ],
      ),
    );
  }
}