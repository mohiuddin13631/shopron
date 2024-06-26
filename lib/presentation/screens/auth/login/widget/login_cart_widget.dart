import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/utils/my_color.dart';
import '../../../../../config/utils/my_images.dart';
class LoginCartWidget extends StatelessWidget {
  const LoginCartWidget({
    super.key,
  });


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(15),
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        color: MyColor.primaryColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1,color: MyColor.colorWhite),
      ),
      child: SvgPicture.asset(MyImages.shoppingCart,colorFilter: const ColorFilter.mode(MyColor.colorWhite, BlendMode.srcIn),),
    );
  }
}
