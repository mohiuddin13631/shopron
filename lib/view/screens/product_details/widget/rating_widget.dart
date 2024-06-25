import 'package:flutter/material.dart';
import 'package:flutter_prime/data/controller/product_details/product_details_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/my_color.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../data/controller/home/home_controller.dart';
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