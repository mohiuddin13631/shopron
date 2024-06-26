import 'package:flutter/material.dart';

import '../../../config/utils/dimensions.dart';
import '../../../config/utils/my_color.dart';
class HorizontalDivider extends StatelessWidget {
  const HorizontalDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Dimensions.space7),
      width: 1,
      height: 6,
      color: MyColor.colorGrey,
    );
  }
}