import 'package:flutter/material.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/style.dart';
class CustomRichText extends StatelessWidget {

  final String title;
  final String subTitle;
  final double bottomSpacing;

  const CustomRichText({
    super.key,
    required this.title,
    required this.subTitle,
    this.bottomSpacing = 4
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
            text: TextSpan(
                style: regularDefaultInter.copyWith(height: Dimensions.textLineSpacing,letterSpacing: Dimensions.textCharSpacing),
                children: [
                  TextSpan(
                    text: '$title : ',
                    style: regularDefaultInter.copyWith(color: MyColor.primaryTextColor),
                  ),
                  TextSpan(
                    text: subTitle,
                    style: regularDefaultInter,
                  ),
                ]
            )
        ),
        SizedBox(height: bottomSpacing,)
      ],
    );
  }
}