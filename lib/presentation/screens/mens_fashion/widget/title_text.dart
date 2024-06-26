import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/utils/style.dart';
class TitleText extends StatelessWidget {

  final String title;

  const TitleText({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return Text(title.tr,style: semiBoldLargeInter.copyWith(fontWeight: FontWeight.w500,fontSize: 12));
  }
}