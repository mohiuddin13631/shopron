import 'package:flutter/material.dart';
import 'package:shopron/config/utils/dimensions.dart';
import 'package:shopron/config/utils/my_color.dart';

class CustomDivider extends StatelessWidget {

  final double space;
  final Color color;
  final double dividerHeight;

  const  CustomDivider({
    Key? key,
    this.space = Dimensions.space20,
    this.color = MyColor.colorBlack,
    this.dividerHeight = 10
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         SizedBox(height: space),
         Divider(color: MyColor.colorLightGrey, height: 0.5 , thickness: dividerHeight),
         SizedBox(height: space),
      ],
    );
  }
}
