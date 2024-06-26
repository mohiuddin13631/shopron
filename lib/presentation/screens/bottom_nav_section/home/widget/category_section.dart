import 'package:flutter/material.dart';
import 'package:shopron/config/utils/util.dart';
import 'package:shopron/domain/product/my_product.dart';
import 'package:shopron/presentation/components/image/circle_shape_image.dart';
import 'package:get/get.dart';

import '../../../../../config/route/route.dart';
import '../../../../../config/utils/dimensions.dart';
import '../../../../../config/utils/my_color.dart';
import '../../../../../config/utils/my_images.dart';
import '../../../../../config/utils/my_strings.dart';
import '../../../../../config/utils/style.dart';
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
                onTap: () => Get.toNamed(RouteHelper.categoryDetailsScreen,arguments: MyProduct.categoryList[index]),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: Dimensions.space7),
                  padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 6),
                  decoration: BoxDecoration(
                    color: MyColor.colorLightGrey.withOpacity(.7),
                    // border: Border.all(width: .7,color: MyColor.borderColor),
                    borderRadius: BorderRadius.circular(Dimensions.space7),
                    boxShadow: MyUtils.getBottomSheetShadow()
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