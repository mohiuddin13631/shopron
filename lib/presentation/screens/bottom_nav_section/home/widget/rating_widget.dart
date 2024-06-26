import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../config/utils/dimensions.dart';
import '../../../../../config/utils/my_color.dart';
import '../../../../../config/utils/my_images.dart';
import '../../../../../config/utils/style.dart';
import '../../../../../domain/controller/home/home_controller.dart';
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
      children: [
        Row(
          children: List.generate(5, (index) => SvgPicture.asset(MyImages.star,width: 14,height: 14,),),
        ),
        Text(" (425)",style: regularSmall.copyWith(color: MyColor.naturalDark2),)
      ],
    );
    /*return Row(
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
    );*/
  }
}