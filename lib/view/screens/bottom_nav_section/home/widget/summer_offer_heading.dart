import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/my_color.dart';
import '../../../../../core/utils/my_strings.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../data/controller/home/home_controller.dart';
class SummerOfferHeading extends StatelessWidget {

  HomeController controller;

  SummerOfferHeading({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(Dimensions.space16, Dimensions.space13,  Dimensions.space14, Dimensions.space11),
      child: Row(
        children: [
          Text(MyStrings.summerOffer.tr,style: titleText.copyWith(color: MyColor.titleColor)),
          const SizedBox(width: Dimensions.space8,),
          SizedBox(
            width: Dimensions.space120,
            height: Dimensions.space14,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.productSize.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(right: Dimensions.space3),
                  width: Dimensions.space28,
                  decoration: BoxDecoration(
                    color: MyColor.primaryColor,
                    borderRadius: BorderRadius.circular(3)
                  ),
                  child: Text("${controller.productSize[index]}${controller.productSizeName[index]}",style: semiBoldDefault.copyWith(color: MyColor.colorWhite,fontSize: Dimensions.space8)),
                );
              },
            ),
          ),
          const Spacer(),
          Text(MyStrings.viewAll.tr,style: regularSmall.copyWith(color: MyColor.primaryColor)),
        ],
      ),
    );
  }
}