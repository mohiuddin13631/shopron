import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/utils/style.dart';
class SubHeadingText extends StatelessWidget {

  final String text;
  final double bottomSpacing;

  const SubHeadingText({
    super.key,
    required this.text,
    this.bottomSpacing = 5.0
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: bottomSpacing),
      child: Text(text.tr,style: semiBoldOverLarge.copyWith(fontSize: 12)),
    );
  }
}