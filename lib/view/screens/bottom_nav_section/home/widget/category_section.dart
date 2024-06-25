import 'package:flutter/material.dart';
import 'package:flutter_prime/data/product/my_product.dart';
import 'package:flutter_prime/view/components/image/circle_shape_image.dart';
import 'package:get/get.dart';

import '../../../../../core/route/route.dart';
import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/my_color.dart';
import '../../../../../core/utils/my_images.dart';
import '../../../../../core/utils/my_strings.dart';
import '../../../../../core/utils/style.dart';
import 'custom_row_header.dart';
class CategorySection extends StatelessWidget {

  final String categoryType;

  const CategorySection({
    super.key,
    this.categoryType = MyStrings.category
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomRowHeader(title: categoryType,viewAllPress: (){}),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Row(
              children: List.generate(MyProduct.categoryList.length, (index) => InkWell(
                onTap: () => Get.toNamed(RouteHelper.mensFashionScreen),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: Dimensions.space7),
                  padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 6),
                  decoration: BoxDecoration(
                    color: MyColor.colorLightGrey,
                    borderRadius: BorderRadius.circular(Dimensions.space7)
                  ),
                  child: Row(
                    children: [
                      Image.asset(MyProduct.categoryList[index].image,width: 50,height: 50,),
                      const SizedBox(width: Dimensions.space8,),
                      Text(MyProduct.categoryList[index].title,style: mediumSmall.copyWith(fontSize: 12))
                    ],
                  ),
                ),
              )),
            ),
          ),
        ),
        const SizedBox(height: Dimensions.space30,),
      ],
    );
  }
}