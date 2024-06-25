import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_images.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/data/controller/product_details/product_details_controller.dart';
import 'package:flutter_prime/view/components/divider/custom_divider.dart';
import 'package:flutter_prime/view/components/text/body_text.dart';
import 'package:flutter_prime/view/screens/product_details/widget/sub_heading_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/style.dart';
class ReviewSection extends StatelessWidget {

  final ProductDetailsController controller;

  const ReviewSection({
    super.key,
    required this.controller
  });


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: List.generate(controller.reviewPercentage.length, (index) => Column(
            children: [
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: controller.numberOfStar[index],
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
                  const SizedBox(width: Dimensions.space30,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: MyColor.borderColor,
                        borderRadius: BorderRadius.circular(Dimensions.space10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              height: Dimensions.space5,
                              width: (size.width * .5) * controller.reviewPercentage[index] / 100,
                              decoration: BoxDecoration(
                                  color: MyColor.colorOrange,
                                  borderRadius: BorderRadius.circular(Dimensions.space10)
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: Dimensions.space13,),
                  Text("${controller.reviewPercentage[index]}%",style: semiBoldLargeInter.copyWith(fontWeight: FontWeight.w400),)
                ],
              ),
              const SizedBox(height: Dimensions.space12,)
            ],
          )),
        ),
        const SizedBox(height: Dimensions.space20,),
         SubHeadingText(text: MyStrings.esthatHoward.tr,bottomSpacing: Dimensions.space10),
        Row(
          children: [
            const CircleAvatar(
              radius: Dimensions.space15,
              backgroundImage: AssetImage(MyImages.mensFashion),
            ),
            const SizedBox(width: Dimensions.space8),
            RatingBar.builder(
              initialRating: 5,
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
            const Spacer(),
            const BodyText(text: MyStrings.dateText),
          ],
        ),
        const SizedBox(height: Dimensions.space8,),
        BodyText(text: controller.userComments),
        const CustomDivider(dividerHeight: 2,),


        Row(
          children: [
            const CircleAvatar(
              radius: 15,
              backgroundImage: AssetImage(MyImages.mensFashion),
            ),
            const SizedBox(width: Dimensions.space8),
            RatingBar.builder(
              initialRating: 5,
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
            const Spacer(),
            const BodyText(text: MyStrings.dateText),
          ],
        ),
        const SizedBox(height: Dimensions.space8),
        BodyText(text: controller.userComments),
      ],
    );
  }
}