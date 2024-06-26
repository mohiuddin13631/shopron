import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_images.dart';
import '../../../../config/utils/style.dart';
import 'connection_line_widget.dart';
class TimeLineWidget extends StatelessWidget {

  final bool isActive;
  final String title;
  final String bodyText;
  final String svgImage;
  final bool endTrack;

  const TimeLineWidget({
    super.key,
    required this.isActive,
    required this.title,
    this.bodyText = "",
    required this.svgImage,
    this.endTrack = false
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundColor: isActive ? MyColor.trackOrderIconBgColor:MyColor.trackOrderInactiveIconColor,
              radius: Dimensions.trackOrderFirstRadius,
              child: CircleAvatar(
                radius: Dimensions.trackOrderSecondRadius,
                backgroundColor: isActive ? MyColor.primaryColor : MyColor.colorWhite,
                child: SvgPicture.asset(svgImage,colorFilter: ColorFilter.mode(isActive? MyColor.colorWhite : MyColor.trackOrderInactiveIconColor, BlendMode.srcIn)),
              ),
            ),
            endTrack?const SizedBox.shrink() : ConnectionLineWidget(isActive: isActive)
          ],
        ),
        const SizedBox(width: Dimensions.space20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title.tr,style: semiBoldDefault.copyWith(fontWeight: FontWeight.w500)),
            const SizedBox(height: Dimensions.space8,),
            Text(bodyText.tr,style: regularDefaultInter)
          ],
        )
      ],
    );
  }
}