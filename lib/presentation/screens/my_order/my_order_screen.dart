import 'package:flutter/material.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/config/utils/style.dart';
import 'package:shopron/domain/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:shopron/domain/controller/my_order/my_order_controller.dart';
import 'package:shopron/domain/controller/my_order/my_order_controller.dart';
import 'package:shopron/domain/controller/top_brand/top_brand_controller.dart';
import 'package:shopron/presentation/components/popscope_widget.dart';
import 'package:shopron/presentation/screens/my_order/widget/my_order_cart.dart';
import 'package:shopron/presentation/screens/my_order/widget/order_history_list_item.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../config/route/route.dart';
import '../../../config/utils/my_images.dart';
import '../../../config/utils/my_strings.dart';
import '../../../domain/controller/my_cart/my_cart_controller.dart';
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
    controller.loadData();
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
            backgroundColor: MyColor.colorLightGrey,
            appBar: AppBar(
              centerTitle: true,
              title: Text(MyStrings.myOrder.tr,style: titleText,),
              leading: widget.isShowBackButton ? IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {
                  if(widget.customRoute.isNotEmpty){
                    Get.offAllNamed(widget.customRoute);
                  }else{
                    Get.back();
                  }
                },
                icon: SvgPicture.asset(MyImages.backButton)
              ) : null,
              automaticallyImplyLeading: false,
            ),
            body: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
              shrinkWrap: true,
              itemCount: controller.orderHistoryList.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                OrderHistoryListItemModel item = controller.orderHistoryList[index];
                return GestureDetector(
                    onTap: () => Get.toNamed(RouteHelper.trackOrderScreen),
                    child: OrderHistoryListItem(
                      orderNumber: item.orderNumber,
                      orderId: item.orderId,
                      itemTitle: item.itemTitle,
                      price: item.price,
                      totalItem: item.totalItem,
                      status: item.status,
                      itemImage: item.itemImage,
                      storeName: item.storeName,
                      date: item.date,
                      index: index,
                    )
                    // MyOrderCart(controller: controller)
                );
              },
            ),
          ),
        )
    );
  }
}
