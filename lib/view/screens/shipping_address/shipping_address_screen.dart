import 'package:flutter/material.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/data/controller/shipping_address/shipping_address_controller.dart';
import 'package:flutter_prime/view/components/divider/custom_divider.dart';
import 'package:flutter_prime/view/components/text/cart_sub_text.dart';
import 'package:flutter_prime/view/screens/shipping_address/widget/add_new_address_section.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/my_images.dart';
import '../../../core/utils/my_strings.dart';
import '../../components/app-bar/custom_appbar.dart';
import '../../components/checkbox/circular_check_box.dart';
class ShippingAddressScreen extends StatefulWidget {
  const ShippingAddressScreen({super.key});

  @override
  State<ShippingAddressScreen> createState() => _ShippingAddressScreenState();
}

class _ShippingAddressScreenState extends State<ShippingAddressScreen> {

  @override
  void initState() {
    final controller = Get.put(ShippingAddressController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<ShippingAddressController>(
      builder: (controller) => Scaffold(
        backgroundColor: MyColor.backGroundScreenColor,
        appBar: const CustomAppBar(
          title: MyStrings.shippingAddress,
          leadingImage: MyImages.backButton,
        ),
        body: SingleChildScrollView(
          padding: Dimensions.shippingAddressPadding,
          child: Column(
            children: [
              Container(
                padding: Dimensions.shippingAddressPadding,
                decoration: BoxDecoration(
                  color:  MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(Dimensions.space5)
                ),
                child: Column(
                  children: [
                    Column( 
                      children: List.generate(7, (index) => Column(
                        children: [
                          GestureDetector(
                            onTap:() {
                              controller.setCurrentIndex(index);
                            },
                            child: Row(
                              children: [
                                CircularCheckBox(controller: controller,index: index),
                                const SizedBox(width: Dimensions.space15),
                                CartSubText(text: MyStrings.dummyAddresstext.tr,fontSize: 13,)
                              ],
                            ),
                          ),
                          const SizedBox(height: Dimensions.space22,)
                        ],
                      )),
                    ),
                    const CustomDivider(dividerHeight: 1.5),
                    const AddNewAddressSection(),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}




