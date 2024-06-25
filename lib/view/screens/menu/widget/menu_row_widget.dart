import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../components/text/default_text.dart';

class MenuRowWidget extends StatelessWidget {

  final String image;
  final String label;
  final VoidCallback onPressed;
  final String? number;
  final bool isLoading;
  final double iconSize;

  const MenuRowWidget({
    Key? key,
    required this.image,
    required this.label,
    required this.onPressed,
    this.number,
    this.iconSize = 18,
    this.isLoading = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: isLoading?const Center(child: SizedBox(
          height:20,
          width:20,
          child: CircularProgressIndicator(color: MyColor.primaryColor,))):Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  image.isEmpty?const SizedBox.shrink():
                  image.contains('svg')?
                  SvgPicture.asset(image, color: MyColor.colorGrey, height: iconSize, width: iconSize,fit: BoxFit.cover):
                  Image.asset(image, color: MyColor.colorGrey, height: 15, width: 15,fit: BoxFit.cover,),
                  image.isEmpty?const SizedBox.shrink():const SizedBox(width: Dimensions.space15),
                  Text(label,style: mediumLarge.copyWith(color: MyColor.naturalDark2),),
                  // DefaultText(text: label, textColor: MyColor.getTextColor())
                ],
              ),
            image.isEmpty?DefaultText(text: number.toString()):Container(
              alignment: Alignment.center,
              height: 30, width: 30,
              decoration: const BoxDecoration(color: MyColor.transparentColor, shape: BoxShape.circle),
              child: const Icon(Icons.arrow_forward_ios_rounded, color: MyColor.colorGrey, size: 15),
            )
          ],
        ),
      ),
    );
  }
}
