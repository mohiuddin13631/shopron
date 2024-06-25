import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionButtonIconWidget extends StatelessWidget {

  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback? pressed;
  final double size;
  final double spacing;
  final IconData? icon;
  final bool isImage;
  final String? imageSrc;
  final bool isLoading;

  const ActionButtonIconWidget({
    Key? key,
    this.backgroundColor = MyColor.primaryColor,
    this.iconColor = MyColor.colorWhite,
    required this.pressed,
    this.size = 30,
    this.spacing = 15,
    this.icon,
    this.imageSrc,
    this.isImage = false,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        height: size, width: size,
        alignment: Alignment.center,
        padding: EdgeInsets.all(isLoading?5:0),
        margin: EdgeInsets.only(right: spacing),
        // decoration: BoxDecoration(color: backgroundColor,),
        child: isLoading? SizedBox(height:size/2,width:size/2,child: const CircularProgressIndicator(color: MyColor.primaryColor)) : isImage ? SvgPicture.asset(
          imageSrc!,

          // color: iconColor,
          height: 20,
          width: 20
        ) : Icon(
          icon,
          color: iconColor,
          size: size
        ),
      ),
    );
  }
}
