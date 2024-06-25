
import 'package:flutter/material.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../data/controller/track_order/track_order_controller.dart';
class ConnectionLineWidget extends StatelessWidget {

  final bool isActive;
  final double lineHeight;

  const ConnectionLineWidget({
    super.key,
    required this.isActive,
    this.lineHeight = Dimensions.trackOrderInActiveLineHeight
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: Dimensions.trackOrderFirstRadius,),
      height: isActive ? Dimensions.trackOrderActiveLineHeight : Dimensions.trackOrderInActiveLineHeight,
      width: 1.5,
      color: isActive ? MyColor.primaryColor : MyColor.trackOrderInactiveIconColor,
    );
  }
}