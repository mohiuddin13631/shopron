import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
class CustomNavBarIcon extends StatelessWidget {

  final String svgImage;

  const CustomNavBarIcon({
    super.key,
    required this.svgImage
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SvgPicture.asset(svgImage),
    );
  }
}