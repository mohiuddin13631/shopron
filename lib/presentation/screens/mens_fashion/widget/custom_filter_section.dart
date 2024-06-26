import 'package:flutter/material.dart';
import 'package:shopron/presentation/screens/mens_fashion/widget/price_range_section.dart';
import 'package:shopron/presentation/screens/mens_fashion/widget/size_section.dart';
import 'package:shopron/presentation/screens/mens_fashion/widget/title_text.dart';
import 'package:get/get.dart';

import '../../../../config/utils/dimensions.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/mens_fashion/mens_fashion_controller.dart';
import '../../../components/buttons/rounded_border_container.dart';
import '../../../components/divider/custom_divider.dart';
import 'brand_section.dart';
import 'button_section.dart';
import 'color_section.dart';
import 'mens_fashion_section.dart';
class CustomFilterSection extends StatelessWidget {

  final MensFashionController controller;

  const CustomFilterSection({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        width: size.width * .7,
        height: double.maxFinite,
        color: MyColor.colorWhite,
        child: ListView(
          padding: Dimensions.filterDrawerPadding,
          children: [
            Row(
              children: [
                Text(MyStrings.filter.tr,style: semiBoldLargeInter.copyWith(fontSize: 16)),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: const EdgeInsets.all(Dimensions.space4),
                    child: Text(MyStrings.close.tr,style: regularDefault),
                  ),
                )
              ],),
            const SizedBox(height: Dimensions.space31),
            Text(MyStrings.categories.tr,style: semiBoldLargeInter.copyWith(fontWeight: FontWeight.w700)),
            const SizedBox(height: Dimensions.space21),
            const TitleText(title: MyStrings.electronics),
            const SizedBox(height: Dimensions.space18),
            MensFashionSection(controller: controller),
            const TitleText(title: MyStrings.healthAndBeauty),
            const SizedBox(height: Dimensions.space20),
            const TitleText(title: MyStrings.babysFashion),
            const SizedBox(height: Dimensions.space20),
            const TitleText(title: MyStrings.weddingsAndEvents),
            const CustomDivider(dividerHeight: 1,space: Dimensions.space34),
            BrandSection(controller: controller),
            const CustomDivider(dividerHeight: 1,space: Dimensions.space34),
            ColorSection(controller: controller),
            const CustomDivider(dividerHeight: 1,space: Dimensions.space34),
            SizeSection(controller: controller),
            const CustomDivider(dividerHeight: 1,space: Dimensions.space34),
            PriceRangeSection(controller: controller),
            const SizedBox(height: Dimensions.space50),
            const ButtonSection()
          ],
        ),
      ),
    );
  }
}


