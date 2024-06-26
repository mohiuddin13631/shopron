import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shopron/config/route/route.dart';
import 'package:shopron/presentation/screens/my_order/widget/status_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../config/utils/util.dart';
import '../../../components/divider/custom_divider.dart';




class OrderHistoryListItem extends StatelessWidget {

  final String orderNumber;
  final String orderId;
  final String itemTitle;
  final String price;
  final String totalItem;
  final String status;
  final String itemImage;
  final String storeName;
  final String date;
  final VoidCallback? onTap;
  final int index;

  const OrderHistoryListItem({
    super.key,
    required this.orderNumber,
    required this.orderId,
    required this.itemTitle,
    required this.price,
    required this.totalItem,
    required this.status,
    required this.itemImage,
    required this.storeName,
    required this.date,
    required this.index,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 8),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: MyColor.colorWhite
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(MyStrings.orderId,style: regularLarge.copyWith(color: MyColor.naturalDark2),),
                    Text(': $orderNumber',style: regularLarge.copyWith(color: MyColor.primaryTextColor),),
                  ],
                ),
                CustomStatusWidget(status: status, index: index,)
              ],
            ),
            // SizedBox(height: Dimensions.space8),
            const CustomDivider(color: MyColor.naturalLight,space: 16,dividerHeight: 1,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.asset(
                        itemImage,
                        height: 48,
                        width: 48,
                      ),
                      const SizedBox(width: Dimensions.space15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              storeName.tr,
                              style: mediumLarge,
                            ),
                            const SizedBox(height: 2,),
                            Text(itemTitle.tr,style: mediumDefault.copyWith(color: MyColor.naturalDark2),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: Dimensions.space12,),
                Column(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Get.toNamed(RouteHelper.trackOrderScreen);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: MyColor.primaryColor,
                          boxShadow: MyUtils.getCardShadow()
                        ),
                        child: Text("Track order",style: mediumDefault.copyWith(color: MyColor.colorWhite),)),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: Dimensions.space8),
            const CustomDivider(color: MyColor.naturalLight,space: 8,dividerHeight: 1,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: Text("Price: ${price.tr}",style: regularLarge.copyWith(color: MyColor.primaryTextColor.withOpacity(.7)),maxLines: 1,overflow: TextOverflow.ellipsis,)),
                Expanded(child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(date,style: regularLarge.copyWith(color: MyColor.naturalLight),maxLines: 1,))
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}