import 'package:flutter/material.dart';

import '../../../../core/utils/dimensions.dart';
import '../../../../core/utils/my_color.dart';

class MenuCard extends StatelessWidget {
  final Widget child;
  const MenuCard({Key? key,required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
    width: MediaQuery.of(context).size.width,
    padding: const EdgeInsets.all(Dimensions.space15),
    decoration: BoxDecoration(
      color: MyColor.colorWhite,
      borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
    child: child,
    );
  }
}
