import 'package:flutter/material.dart';
import 'package:shopron/config/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../../../config/utils/my_strings.dart';
import '../../../components/text/cart_sub_text.dart';
class OrderSummaryFeeWidget extends StatelessWidget {

  final String title;
  final double amount;

  const OrderSummaryFeeWidget({
    super.key,
    required this.title,
    required this.amount
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CartSubText(text: title.tr),
            CartSubText(text: "\$$amount"),
          ],
        ),
        const SizedBox(height: Dimensions.space11)
      ],
    );
  }
}