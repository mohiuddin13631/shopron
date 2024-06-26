import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopron/domain/product/my_product.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_images.dart';
import '../../../../domain/controller/product_details/product_details_controller.dart';
class ProductDetailsTopSection extends StatelessWidget {

  const ProductDetailsTopSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailsController>(
      builder: (controller) => Stack(
          children: [
            CarouselSlider(
              items: MyProduct.detailsPageProductList.map((e) => Image.asset(e.image),).toList(),
              options: CarouselOptions(
                aspectRatio:1.0,
                viewportFraction: 1.0,
                height: Dimensions.pdSliderHeight,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  print(index);
                  controller.setCurrentIndex(index);
                },
              ),
            ),
            Positioned(
                bottom: 10,
                left: MediaQuery.of(context).size.width / 3,
                child: Row(
                  children: List.generate(3, (index) => GestureDetector(
                    onTap: () {
                      // controller.setCurrentIndex(index);
                    },
                    child: Container(
                        padding: const EdgeInsets.symmetric(vertical: Dimensions.space8),
                        margin: const EdgeInsets.only(right: Dimensions.space15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: controller.currentIndex == index? Border.all(color: MyColor.primaryColor):null,
                          borderRadius: BorderRadius.circular(Dimensions.cardRadius),
                        ),
                        child: Image.asset(MyProduct.mensFashionList[index].image,width: 40,height: 20,)
                    ),
                  ),),
                )
            ),
            
            // Positioned(
            //   right: 5,
            //   top: context.height * .12,
            //   child: const Icon(Icons.arrow_forward_ios,color: MyColor.naturalDark2,),
            // )
            
          ]
      ),
    );
  }
}