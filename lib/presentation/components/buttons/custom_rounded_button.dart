import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../config/utils/dimensions.dart';
import '../../../config/utils/my_color.dart';
import '../../../config/utils/my_images.dart';
import '../../../config/utils/style.dart';
class CustomRoundedButton extends StatelessWidget {

  final String labelName;
  final String? svgImage;
  final VoidCallback press;
  final bool isHorizontalPadding;
  final double verticalPadding;
  const CustomRoundedButton({
    super.key,
    required this.labelName,
    required this.press,
    this.svgImage,
    this.isHorizontalPadding = true,
    this.verticalPadding = 10
  });

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: isHorizontalPadding? Dimensions.space16 : 0),
      color: MyColor.colorWhite,
      width: double.infinity,
      height: size.height * .09,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: press,
            child: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(vertical: verticalPadding),
              decoration: BoxDecoration(
                color: MyColor.primaryColor,
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  svgImage != null ?
                  SvgPicture.asset(MyImages.cartIcon):const SizedBox.shrink(),
                  const SizedBox(width: Dimensions.space7),
                  Text(labelName.tr,style: semiBoldLargeInter.copyWith(color: MyColor.colorWhite),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}