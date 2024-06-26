import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import '../../../../config/route/route.dart';
import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/my_strings.dart';
import '../../../../config/utils/style.dart';
import '../../../../domain/controller/onboarding/onboard_controller.dart';

class BottomSection extends StatelessWidget {
  final int index;
  const BottomSection({
    super.key,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnboardController>(
      builder: (controller) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(controller.onboardImageList.length, (index) => Container(
                  margin: const EdgeInsetsDirectional.only(end: 8),
                  width: controller.currentIndex == index ? 22 : 12,
                  height: 12,
                  decoration: BoxDecoration(
                      color: controller.currentIndex == index ? const Color(0xffC6C6C6): const Color(0xffC6C6C6),
                      borderRadius: BorderRadius.circular(15)
                  ),
                ))
            ),

            SizedBox(height: context.height * .06,),

            controller.onboardImageList.length -1 == index ? GestureDetector(
              onTap: () {
                // Get.find<ApiClient>().sharedPreferences.setBool(SharedPreferenceHelper.firstTimeAppOpeningStatus, false);
                Get.toNamed(RouteHelper.loginScreen);
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                    color: MyColor.primaryColor,
                    borderRadius: BorderRadius.circular(50)
                ),
                child: Text(MyStrings.startNow,style: boldLarge.copyWith(color: MyColor.colorWhite,fontWeight: FontWeight.w600,fontSize: 16),),
              ),
            ) :  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    controller.pageController.jumpToPage(controller.onboardImageList.length - 1);
                  },
                  child: Text(MyStrings.skip.tr,style: mediumLarge.copyWith(color: MyColor.onboardSubTitleColor,fontSize: 16)),
                ),

                GestureDetector(
                  onTap: () {
                    if(controller.onboardImageList.length - 1 == index){
                      // Get.find<ApiClient>().sharedPreferences.setBool(SharedPreferenceHelper.firstTimeAppOpeningStatus, false);
                      Get.toNamed(RouteHelper.loginScreen);
                    }else{
                      controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: MyColor.primaryColor
                    ),
                    child: Text(controller.onboardImageList.length - 1 == index ? MyStrings.finish.tr : MyStrings.next.tr,style: mediumLarge.copyWith(color: MyColor.colorWhite,fontSize: 16,),),
                  ),
                ),

              ],
            ),
            const SizedBox(height: 20,)
          ],
        );
      },
    );
  }
}
