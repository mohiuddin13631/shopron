
import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_images.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/helper/date_converter.dart';
import '../../../core/utils/dimensions.dart';
import '../../../core/utils/my_color.dart';
import '../../../core/utils/my_strings.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColor.colorLightGrey,
      appBar: const CustomAppBar(title: MyStrings.myNotification,bgColor: MyColor.primaryColor,isShowBackBtn: true,),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.space16),
          itemCount: 14,
          shrinkWrap: true,
          controller: scrollController,
          physics: const BouncingScrollPhysics(),

          itemBuilder: (context, index) {

            return Container(
              width: context.width,
              decoration: BoxDecoration(
                  color: MyColor.colorWhite,
                  borderRadius: BorderRadius.circular(Dimensions.space5)
              ),
              padding: const EdgeInsets.all(Dimensions.space16),
              margin: EdgeInsets.only(bottom: Dimensions.space8,top: index == 0 ? 12 : 0),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: MyColor.primaryColor,
                    child: SvgPicture.asset(MyImages.notification,width: 18,height: 18,colorFilter: ColorFilter.mode(MyColor.colorWhite, BlendMode.srcIn),),
                  ),

                  const SizedBox(width: 10,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateConverter.getFormatedSubtractTime('2023-08-29T05:32:17.000000Z'),style: mediumDefault,),
                      const SizedBox(height: Dimensions.space4,),
                      Text(MyStrings.orderPlacedSuccessful.tr,style: boldLarge,),
                      const SizedBox(height: Dimensions.space7,),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),

    );
  }
}