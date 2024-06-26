import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../config/utils/dimensions.dart';
import '../../../../../config/utils/my_color.dart';
import '../../../../../config/utils/style.dart';
class DrawerItem extends StatelessWidget {

  final String svgIcon;
  final String title;
  final VoidCallback press;

  const DrawerItem({

    super.key,
    required this.title,
    required this.svgIcon,
    required this.press
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: press,
          leading: Container(
            padding: const EdgeInsets.all(Dimensions.space6),
            decoration: BoxDecoration(
                color: MyColor.colorLightGrey,
                borderRadius: BorderRadius.circular(3)
            ),
            child: SvgPicture.asset(svgIcon,width: Dimensions.drawerIconWidth,colorFilter: ColorFilter.mode(MyColor.naturalDark2, BlendMode.srcIn),),
          ),
          title: Text(title.tr,style: semiBoldLargeInter.copyWith(fontWeight: FontWeight.w500),),
        ),
        const SizedBox(height: Dimensions.space15,)
      ],
    );
  }
}