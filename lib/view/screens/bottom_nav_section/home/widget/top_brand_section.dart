import 'package:flutter/material.dart';

import '../../../../../core/utils/dimensions.dart';
import '../../../../../core/utils/my_color.dart';
import '../../../../../core/utils/my_images.dart';
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
            itemCount: numberOfBrand,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: MyColor.colorLightGrey,
                    borderRadius: BorderRadius.circular(Dimensions.cardRadius)
                ),
                child: Image.asset(MyImages.happenzBrand),
              );
            },
          ),
        ),
        const SizedBox(height: Dimensions.space20,)
      ],
    );
  }
}