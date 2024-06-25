import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/my_color.dart';
import '../../../../../core/utils/style.dart';
import '../../../../../data/controller/home/home_controller.dart';
class CustomRatingWidget extends StatelessWidget {

  HomeController controller;
  final bool isShowTotalRating;

  CustomRatingWidget({
    super.key,
    required this.controller,
    this.isShowTotalRating = true
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RatingBar.builder(
          ignoreGestures: true,
          initialRating: 3,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 18,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: MyColor.colorOrange,
          ),
          onRatingUpdate: (rating) {
            // print(rating);
          },
        ),
        const SizedBox(width: Dimensions.space2,),
        isShowTotalRating ?
        Expanded(child: Text("(${controller.totalRating})",style: regularDefault,)) : const SizedBox()
      ],
    );
  }
}