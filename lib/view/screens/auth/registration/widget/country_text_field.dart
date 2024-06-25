import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/style.dart';

class CountryTextField extends StatelessWidget {

  final String text;
  final VoidCallback press;

  const CountryTextField({Key? key,
    required this.text,
    required this.press
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.defaultRadius),
          border: Border.all(color: MyColor.getTextFieldDisableBorder(),width: .5)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(
              text.tr,
              style: regularDefault.copyWith(color: MyColor.getTextColor())
            ),
            const Icon(
              Icons.expand_more_rounded,color: MyColor.hintTextColor,
              size: 20
            )
          ],
        ),
      ),
    );
  }
}
