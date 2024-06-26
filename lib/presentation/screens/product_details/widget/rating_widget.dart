import 'package:flutter/material.dart';
import 'package:shopron/domain/controller/product_details/product_details_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../config/utils/dimensions.dart';
import '../../../../../config/utils/my_color.dart';
import '../../../../../config/utils/style.dart';
import '../../../../../domain/controller/home/home_controller.dart';
class CustomRatingWidgetForPd extends StatelessWidget {

  ProductDetailsController controller;

  CustomRatingWidgetForPd({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 20,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: MyColor.colorOrange,
          ),
          onRatingUpdate: (rating) {
            // print(rating);
          },
        ),
        const SizedBox(width: Dimensions.space2,),
        Text("(${controller.totalRating})",style: semiBoldDefault,)
      ],
    );
  }
}