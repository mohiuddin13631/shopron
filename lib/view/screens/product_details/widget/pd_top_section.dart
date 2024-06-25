import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_images.dart';
import '../../../../data/controller/product_details/product_details_controller.dart';
class ProductDetailsTopSection extends StatelessWidget {

  final ProductDetailsController controller;

  const ProductDetailsTopSection({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          CarouselSlider(
            items: [Image.asset(controller.imageList[controller.currentIndex])],
            options: CarouselOptions(
              aspectRatio:1.0,
              viewportFraction: 1.0,
              height: Dimensions.pdSliderHeight,
              enableInfiniteScroll: true,
              onPageChanged: (index, reason) {
                controller.setCurrentIndex(index);
              },
            ),
          ),
          /*Positioned(
            top: Dimensions.space16,
            right: Dimensions.space10,
            child: Container(
              padding: const EdgeInsets.all(Dimensions.space3 * 2),
              margin: const EdgeInsets.only(right: Dimensions.space15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Dimensions.cardRadius),
              ),
              child: SvgPicture.asset(MyImages.favorite,colorFilter: const ColorFilter.mode(MyColor.colorGrey, BlendMode.srcIn)),
            ),
          ),*/
          Positioned(
              bottom: 16,
              left: MediaQuery.of(context).size.width / 3,
              child: Row(
                children: List.generate(3, (index) => InkWell(
                  onTap: () {
                    controller.setCurrentIndex(index);
                  },
                  child: Container(
                      padding: const EdgeInsets.symmetric(vertical: Dimensions.space8),
                      margin: const EdgeInsets.only(right: Dimensions.space15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: controller.currentIndex == index? Border.all(color: Colors.orange):null,
                        borderRadius: BorderRadius.circular(Dimensions.cardRadius),
                      ),
                      child: Image.asset(MyImages.snickers)
                  ),
                ),),
              )
          ),
        ]
    );
  }
}