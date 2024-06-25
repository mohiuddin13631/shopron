import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/my_color.dart';
import '../../../../../core/utils/my_images.dart';
class VisibleIcon extends StatelessWidget {

  final String svgImage;

  const VisibleIcon({
    super.key,
    required this.svgImage
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8 ),
      child: SvgPicture.asset(svgImage,width: 16 ,colorFilter: const ColorFilter.mode(MyColor.colorGrey, BlendMode.srcIn),),
    );
  }
}