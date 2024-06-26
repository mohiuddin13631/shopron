import 'package:flutter/material.dart';

import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../components/buttons/rounded_border_container.dart';

class CustomStatusWidget extends StatelessWidget {

  const CustomStatusWidget({
    super.key,
    required this.status,
    required this.index
  });

  final int index;
  final String status;

  @override
  Widget build(BuildContext context) {
    return RoundedBorderContainer(
      text: index % 2 == 0?MyStrings.pending :MyStrings.delivered,
        bgColor: index % 2 == 0 ? MyColor.pendingColor : MyColor.greenSuccessColor ,
      borderColor: index % 2 == 0 ? MyColor.pendingColor : MyColor.greenSuccessColor ,
      textColor: MyColor.colorWhite,
      borderRadius: 50,
      horizontalPadding: 10,
      verticalPadding: 3.5 ,
    );
  }
}