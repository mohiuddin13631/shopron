import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_images.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../core/utils/style.dart';
import '../../../../data/controller/mens_fashion/mens_fashion_controller.dart';
import 'custom_search_field.dart';
class SearchBarSection extends StatelessWidget {

  final MensFashionController controller;

  const SearchBarSection({
    super.key,
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.space16,vertical: Dimensions.space8),
      color: MyColor.colorWhite,
      child: Row(
        children: [
          Expanded(
            child: CustomSearchField(
              controller: controller.searchController,
              textInputType: TextInputType.name,
              hintText: MyStrings.searchInViserMart.tr,
              focusNode: controller.searchFocusNode,
              labelText: MyStrings.searchInViserMart.tr,
              onChanged: (value){},
              prefixIconSvg: MyImages.search,
              svgIconColor: MyColor.iconColor,
              animatedLabel: false,
              needOutlineBorder: true,
              isSearch: true,
              validator: (value) {
                if(value.isEmpty){
                  return MyStrings.fieldErrorMsg.tr;
                }
                else{
                  return null;
                }
              },
            ),
          ),
          const SizedBox(width: Dimensions.space12,),
          InkWell(
            onTap: () {
              controller.scaffoldKey.currentState?.openEndDrawer();
            },
            child: SvgPicture.asset(MyImages.filter)
          )
        ],
      ),
    );
  }
}