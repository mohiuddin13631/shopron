import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shopron/config/utils/util.dart';
import 'package:shopron/presentation/screens/onboard/widget/bottom_section.dart';
import 'package:get/get.dart';

import '../../../config/utils/my_color.dart';
import '../../../config/utils/style.dart';
import '../../../domain/controller/onboarding/onboard_controller.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {


  @override
  void initState() {
    final controller = Get.put(OnboardController());
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    MyUtils.allScreen();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return GetBuilder<OnboardController>(
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        body:  SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: context.height * .1,),
                Expanded(
                  // child: Image.asset(MyImages.onboardImage_1),
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.onboardImageList.length,
                    onPageChanged: (value) {
                      controller.currentIndex = value;
                      controller.update();
                    },
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(controller.onboardImageList[controller.currentIndex],fit: BoxFit.contain,height: context.height * .42,),
                          SizedBox(height: context.height * .1,),
                          Text(controller.onboardTitleList[index],style: boldLarge.copyWith(fontSize: 24,color: MyColor.onboardTitleColor),),
                          const SizedBox(height: 16,),
                          Text(controller.onboardSubTitleList[index],style: regularLarge.copyWith(fontSize: 16,color: MyColor.onboardSubTitleColor),textAlign: TextAlign.center,)
                        ],
                      );
                  },),
                ),
                BottomSection(index: controller.currentIndex)
              ],
            ),
          ),
        ),
      ),
    );
  }
}


