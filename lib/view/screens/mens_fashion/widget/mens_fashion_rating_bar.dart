import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/style.dart';
import '../../../../data/controller/mens_fashion/mens_fashion_controller.dart';
class FashionRatingBar extends StatelessWidget {

  final MensFashionController controller;

  const FashionRatingBar({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: Dimensions.space18,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: MyColor.colorOrange,
          ),
          onRatingUpdate: (rating) {
            // print(rating);
          },
        ),
        const SizedBox(width: Dimensions.space2,),
        Text("(${controller.totalRating})",style: regularDefault,)
      ],
    );
  }
}