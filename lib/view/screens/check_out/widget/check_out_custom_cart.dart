import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:get/get.dart';

import '../../../../core/utils/my_strings.dart';
import '../../../../core/utils/style.dart';
import '../../../components/card/custom_card.dart';
import '../../../components/text/cart_sub_text.dart';
class CheckOutCustomCart extends StatelessWidget {

  final String title;
  final String subTitle;
  final VoidCallback press;

  const CheckOutCustomCart({
    super.key,
    required this.title,
    required this.subTitle,
    required this.press
  });

  @override
  Widget build(BuildContext context) {
    return CustomCard(
        isPress: true,
        onPressed: press,
        paddingLeft: Dimensions.space15,
        paddingRight: Dimensions.space11,
        paddingTop: Dimensions.space15,
        paddingBottom: Dimensions.space20,
        width: double.maxFinite,
        child: Row(
          children: [
            Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Text(title.tr,style: semiBoldLargeInter,),
                const SizedBox(height: Dimensions.space10),
                CartSubText(text: subTitle.tr)
              ],),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_sharp,size: Dimensions.space15,)
          ],
        )
    );
  }
}