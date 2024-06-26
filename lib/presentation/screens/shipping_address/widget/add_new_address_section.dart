import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../config/route/route.dart';
import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../components/text/cart_sub_text.dart';
class AddNewAddressSection extends StatelessWidget {
  const AddNewAddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(RouteHelper.addShippingAddressScreen),
      child: Row(
        children: [
          Container(
            alignment: Alignment.center,
            height: 18,
            width: 18,
            decoration: BoxDecoration(
                border: Border.all(color: MyColor.colorGrey,width: 1),
                shape: BoxShape.circle
            ),
            child: const Icon(Icons.add,size: Dimensions.space12,),
          ),
          const SizedBox(width: Dimensions.space15,),
          const CartSubText(text: MyStrings.addNewAddress,textColor: MyColor.primaryColor,fontSize: 13,)
        ],
      ),
    );
  }
}