import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_images.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/data/controller/account/profile_controller.dart';
import 'package:flutter_prime/view/components/circle_button_with_icon.dart';
import 'package:flutter_prime/view/components/column_widget/card_column.dart';
import 'package:flutter_prime/view/components/divider/custom_divider.dart';
import 'package:flutter_prime/view/components/image/circle_shape_image.dart';

class ProfileTopSection extends StatefulWidget {
  const ProfileTopSection({Key? key}) : super(key: key);

  @override
  State<ProfileTopSection> createState() => _ProfileTopSectionState();
}

class _ProfileTopSectionState extends State<ProfileTopSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space15),
        decoration: BoxDecoration(
            color: MyColor.getCardBgColor(),
            borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: Dimensions.space25),
            CardColumn(
              header: MyStrings.name.tr,
              body: controller.model.data?.user?.username ?? "User name"
            ),
            const CustomDivider(space: Dimensions.space15,dividerHeight: 1.5,),
            CardColumn(
              header: MyStrings.email.tr,
              body: controller.model.data?.user?.email ?? "user@gmail.com"
            ),
            const CustomDivider(space: Dimensions.space15,dividerHeight: 1.5,),

            CardColumn(
              header: MyStrings.phone.tr,
              body: controller.model.data?.user?.mobile ?? "0134568871"
            ),
            const CustomDivider(space: Dimensions.space15,dividerHeight: 1.5,),

            CardColumn(
              header: MyStrings.address.tr,
              body: controller.model.data?.user?.address?.address ?? "New york, USA"
            ),
            const CustomDivider(space: Dimensions.space15,dividerHeight: 1.5,),
            CardColumn(
              header: MyStrings.state.tr,
              body: controller.model.data?.user?.address?.state ?? "New York"
            ),
            const CustomDivider(space: Dimensions.space15,dividerHeight: 1.5,),
            CardColumn(
              header: MyStrings.zipCode.tr,
              body: controller.model.data?.user?.address?.zip ?? "4121"
            ),
            const CustomDivider(space: Dimensions.space15,dividerHeight: 1.5,),
            CardColumn(
              header: MyStrings.city.tr,
              body: controller.model.data?.user?.address?.city ?? "New York"
            ),
            const CustomDivider(space: Dimensions.space15,dividerHeight: 1.5,),
            CardColumn(
              header: MyStrings.country.tr,
              body: controller.model.data?.user?.address?.country ?? "USA"
            ),
          ],
        ),
      ),
    );
  }
}
