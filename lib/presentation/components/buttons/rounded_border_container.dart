import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopron/config/utils/dimensions.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/config/utils/style.dart';

class RoundedBorderContainer extends StatelessWidget {

  const RoundedBorderContainer({Key? key,
    required this.text,
    this.borderColor= MyColor.primaryColor,
    this.bgColor= MyColor.primaryColor,
    this.horizontalPadding=12,
    this.verticalPadding=5,
    this.borderWidth = 1.5,
    this.borderRadius = 4,
    this.textSize = Dimensions.fontSmall,
    this.textColor= MyColor.primaryColor}) : super(key: key);

    final Color bgColor,textColor,borderColor;
    final double horizontalPadding,verticalPadding;
    final String text;
    final double borderWidth;
    final double textSize;
    final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding,vertical: verticalPadding),
      decoration: BoxDecoration(
        color: bgColor.withOpacity(.15),
        borderRadius: BorderRadius.circular(borderRadius),
        border:Border.all(color: borderColor.withOpacity(.5),width:borderWidth)
      ),
      child: Text(
        text.tr,
        style: semiBoldLargeInter.copyWith(color:bgColor,fontSize: textSize)
      ),
    );
  }
}
