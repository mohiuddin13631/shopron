import 'package:flutter/material.dart';
import 'package:shopron/domain/product/my_product.dart';

import '../../../../../config/utils/dimensions.dart';
import '../../../../../config/utils/my_color.dart';
import '../../../../../config/utils/my_images.dart';
class TopBrandSection extends StatelessWidget {

  final int numberOfBrand;
  final double topPadding;
  final double rightPadding;

  const TopBrandSection({

    super.key,
    this.numberOfBrand = 6,
    this.topPadding = 0,
    this.rightPadding = Dimensions.space11
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(Dimensions.space16,topPadding, rightPadding, Dimensions.space11),
          child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: Dimensions.space6,
                mainAxisSpacing: Dimensions.space5,
                childAspectRatio: 1.8
            ),
            itemCount: MyProduct.companyLogoList.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(13),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: MyColor.colorWhite,
                    border: Border.all(width: .7,color: MyColor.borderColor),
                    borderRadius: BorderRadius.circular(Dimensions.cardRadius)
                ),
                child: Image.asset(MyProduct.companyLogoList[index].image),
              );
            },
          ),
        ),
        const SizedBox(height: Dimensions.space20,)
      ],
    );
  }
}