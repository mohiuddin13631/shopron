import 'package:flutter/material.dart';
import 'package:shopron/config/utils/dimensions.dart';
import 'package:shopron/config/utils/my_color.dart';

import 'custom_svg_picture.dart';

class CircleShapeImage extends StatefulWidget {

  final String image;
  final Color backgroundColor;
  final Color? imageColor;
  final double size;
  final bool isSvgImage;
  final double? insidePadding;

  const CircleShapeImage({
    Key? key,
    this.backgroundColor = MyColor.screenBgColor,
    this.imageColor,
    this.size = 35,
    required this.image,
    this.isSvgImage = false,
    this.insidePadding

  }) : super(key: key);

  @override
  State<CircleShapeImage> createState() => _CircleShapeImageState();
}

class _CircleShapeImageState extends State<CircleShapeImage> {
  @override
  Widget build(BuildContext context) {
    return widget.isSvgImage ? Container(
      height: widget.size, width: widget.size,
      padding: EdgeInsets.all(widget.insidePadding??0.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        shape: BoxShape.circle
      ),
      child: CustomSvgPicture(image:widget.image, color: widget.imageColor??MyColor.primaryColor, height: widget.size / 2, width: widget.size / 2),
    ) : Container(
      height: widget.size, width: widget.size,
      padding: EdgeInsets.all(widget.insidePadding??0.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: widget.backgroundColor,
          shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(widget.image,),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
