import 'package:flutter/material.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_images.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/data/controller/check_out/check_out_controller.dart';
import 'package:flutter_prime/view/components/alert-dialog/custom_alert_dialog.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:flutter_prime/view/components/buttons/custom_rounded_button.dart';
import 'package:flutter_prime/view/components/card/custom_card.dart';
import 'package:flutter_prime/view/components/divider/custom_divider.dart';
import 'package:flutter_prime/view/components/text/cart_sub_text.dart';
import 'package:flutter_prime/view/screens/check_out/widget/check_out_custom_cart.dart';
import 'package:flutter_prime/view/screens/check_out/widget/online_payment_bottom_sheet.dart';
import 'package:flutter_prime/view/screens/check_out/widget/order_summary_fee_widget.dart';
import 'package:flutter_prime/view/screens/check_out/widget/shipping_bottom_sheet.dart';
import 'package:flutter_prime/view/screens/my_order/my_order_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/dimensions.dart';
import '../../components/bottom-sheet/custom_bottom_sheet.dart';
class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {

  @override
  void initState() {
    final controller = Get.put(CheckOutController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckOutController>(
      builder: (controller) => Scaffold(
        backgroundColor: MyColor.backGroundScreenColor,
        appBar: const CustomAppBar(
          title: MyStrings.checkOut,
          leadingImage: MyImages.backButton,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(Dimensions.space16),
          child: Column(
            children: [
              CheckOutCustomCart(title: MyStrings.shippingAddress,subTitle: MyStrings.addShippingAddress,press: ()=>Get.toNamed(RouteHelper.shippingAddressScreen)),
              CheckOutCustomCart(
                title: MyStrings.paymentMethod,
                subTitle: MyStrings.choosePaymentMethod,
                press: (){
                  CustomBottomSheet(
                      child: GetBuilder<CheckOutController>(builder: (controller)=>OnlinePaymentBottomSheet(controller: controller,))
                  ).customBottomSheet(context);
                }),
              CheckOutCustomCart(title: MyStrings.shippingMethod, subTitle: MyStrings.chooseShippingMethod,press: (){
                CustomBottomSheet(
                    child: GetBuilder<CheckOutController>(builder: (controller)=>ShippingBottomSheet(controller: controller))
                ).customBottomSheet(context);
              }),
              CustomCard(
                  isPress: true,
                  onPressed: (){},
                  paddingLeft: Dimensions.space15,
                  paddingRight: Dimensions.space11,
                  paddingTop: Dimensions.space15,
                  paddingBottom: Dimensions.space20,
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(MyStrings.orderSummary,style: semiBoldLargeInter),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CartSubText(text: MyStrings.cartSubtext.tr),
                          CartSubText(text: "\$${controller.subTotal}"),
                        ],
                      ),
                      const CustomDivider(dividerHeight: 1.5),
                      OrderSummaryFeeWidget(title: MyStrings.subTotal.tr,amount: controller.subTotal),
                      OrderSummaryFeeWidget(title: MyStrings.discount.tr,amount: controller.discount),
                      OrderSummaryFeeWidget(title: MyStrings.deliveryFee.tr,amount: controller.deliveryFee),
                      OrderSummaryFeeWidget(title: MyStrings.vat.tr,amount: controller.vat),
                      OrderSummaryFeeWidget(title: MyStrings.total.tr,amount: controller.total),
                    ],
                  )
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: MyColor.colorWhite,
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space10,vertical: Dimensions.space14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${MyStrings.total} : \$${controller.total}",style: semiBoldLargeInter,),
              CustomRoundedButton(
                verticalPadding: 12,
                labelName: MyStrings.placeOrder,
                press: (){

                  CustomAlertDialog(
                    child: Column(
                      children: [
                        Image.asset(MyImages.checkOut,width: 70,height: 70,color: MyColor.primaryColor,),
                        const SizedBox(height: 10,),
                        Text(MyStrings.orderPlacedSuccessful.tr,style: mediumLarge.copyWith(color: MyColor.colorBlack),),
                        const SizedBox(height: 10,),
                        CustomRoundedButton(
                          labelName: MyStrings.ok.tr,
                          press: () {
                            Get.offAll(const MyOrderScreen(customRoute: RouteHelper.bottomNavBar));
                          },
                        )
                      ],
                    )
                  ).customAlertDialog(context);

                }
              )
            ],
          ),
        ),
      ),
    );
  }
}




