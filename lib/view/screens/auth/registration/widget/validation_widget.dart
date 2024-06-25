
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/data/model/model/error_model.dart';
import 'validation_chip_widget.dart';

class ValidationWidget extends StatelessWidget {

  final List<ErrorModel>list;
  final bool fromReset;

  const ValidationWidget({
    Key? key,
    required this.list,
    this.fromReset = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: Dimensions.textToTextSpace),
        Wrap(
          children: list.map((item) =>  ChipWidget(name: item.text.tr,hasError: item.hasError,)
          ).toList(),
        ),
        fromReset?const SizedBox(height: Dimensions.space12):const SizedBox()
      ],
    );
  }
}
