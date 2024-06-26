import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../config/utils/dimensions.dart';
import '../../../../../config/utils/my_color.dart';
import '../../../../../config/utils/my_strings.dart';
import '../../../../../config/utils/style.dart';
class CustomRowHeader extends StatelessWidget {

  final String title;
  final bool isHorizontalSpacing;
  final VoidCallback viewAllPress;

  const CustomRowHeader({
    super.key,
    required this.title,
    this.isHorizontalSpacing = true,
    required this.viewAllPress
  });

  @override
  Widget build(BuildContext context) {
    return isHorizontalSpacing? Padding(
      padding: const EdgeInsets.fromLTRB(Dimensions.space16, Dimensions.space13,  Dimensions.space14, Dimensions.space13),
      child: Row(
        children: [
          Text(title,style: titleText.copyWith(color: MyColor.titleColor,fontFamily: "Poppins"),),
          const Spacer(),
          // InkWell(
          //   onTap: viewAllPress,
          //   child: Text(MyStrings.viewAll.tr,style: regularSmall.copyWith(color: MyColor.primaryColor,fontSize: 12,fontFamily: "Poppins"),)
          // ),
        ],
      ),
    ):Padding(
      padding: const EdgeInsets.fromLTRB(Dimensions.space16, Dimensions.space13,  Dimensions.space14, Dimensions.space13),
      child: Row(
        children: [
          Text(title,style: titleText.copyWith(color: MyColor.titleColor,fontFamily: "Poppins"),),
          const Spacer(),
          InkWell(
            onTap: viewAllPress,
            child: Text(MyStrings.viewAll.tr,style: regularSmall.copyWith(color: MyColor.primaryColor,fontSize: 12,fontFamily: "Poppins"),)),
        ],
      ),
    );
  }
}