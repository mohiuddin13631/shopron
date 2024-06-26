import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/utils/dimensions.dart';
import '../../../../../config/utils/my_color.dart';
import '../../../../../config/utils/my_strings.dart';
import '../../../../../config/utils/style.dart';
import '../../../../../domain/controller/home/home_controller.dart';
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
        ],
      ),
    );
  }
}