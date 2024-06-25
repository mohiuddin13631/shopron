import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:get/get.dart';

import '../../../../../data/controller/home/home_controller.dart';
import '../../../../../data/product/my_product.dart';
import 'custom_row_header.dart';
import 'product_card.dart';
class CustomProductSection extends StatelessWidget {

  final String productType;
  final HomeController controller;
  final bool enableDiscount;
  final List<ProductModel> productList;

  const CustomProductSection({
    super.key,
    required this.controller,
    required this.productType,
    this.enableDiscount = false,
    required this.productList
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRowHeader(title: productType.tr,viewAllPress: (){}),
        ProductList(controller: controller,productList: productList,),
      ],
    );
  }
}
