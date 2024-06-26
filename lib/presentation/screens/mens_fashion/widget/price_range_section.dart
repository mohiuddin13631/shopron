import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_images.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/mens_fashion/mens_fashion_controller.dart';
import 'custom_check_box_circular.dart';
class PriceRangeSection extends StatelessWidget {

  final MensFashionController controller;

  const PriceRangeSection({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MyStrings.priceRange,style: semiBoldLargeInter.copyWith(fontWeight: FontWeight.w700,fontSize: 14)),
        const SizedBox(height: Dimensions.space15),
        RangeSlider(
          activeColor: MyColor.primaryColor,
          inactiveColor: MyColor.textFieldDisableBorderColor,
          values: RangeValues(controller.rangeStartValue, controller.rangeEndValue),
          min: 0,
          max: 200,
          divisions: 50,
          onChanged: (RangeValues values) {
            controller.setStartAndEndValue(values.start, values.end);
          },
        ),
        const SizedBox(height: Dimensions.space10,),
        Row(children: [
          Text(MyStrings.price,style: regularDefaultInter.copyWith(fontSize: Dimensions.space14)),
          const Spacer(),
          Text("\$${controller.rangeStartValue.toStringAsFixed(0)} - \$${controller.rangeEndValue.toStringAsFixed(0)}",style: regularDefaultInter.copyWith(fontSize: Dimensions.space14))
        ],),
      ],
    );
  }
}