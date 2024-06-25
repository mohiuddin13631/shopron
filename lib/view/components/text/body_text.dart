import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/style.dart';

class BodyText extends StatelessWidget {

  final String text;
  final Color? textColor;

  const BodyText({
    Key? key,
    required this.text,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      style: regularDefaultInter.copyWith(height: 1.7,letterSpacing: 1,color: textColor),
    );
  }
}
