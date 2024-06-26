import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/config/utils/my_images.dart';
import 'package:shopron/config/utils/util.dart';
import 'package:shopron/domain/controller/localization/localization_controller.dart';
import 'package:shopron/domain/controller/splash/splash_controller.dart';
import 'package:shopron/domain/repo/auth/general_setting_repo.dart';
import 'package:shopron/domain/services/api_service.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    MyUtils.splashScreen();
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(GeneralSettingRepo(apiClient: Get.find()));
    Get.put(LocalizationController(sharedPreferences: Get.find()));
    final controller = Get.put(SplashController(repo: Get.find(),localizationController: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      controller.gotoNextPage();
    });
  }

  @override
  void dispose() {
    MyUtils.allScreen();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        backgroundColor: controller.noInternet ? MyColor.colorWhite : MyColor.colorWhite,
        body: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Image.asset(MyImages.appLogo, height: context.width * .5, width: context.width * .5),
            ),
          ],
        ),
      ),
    );
  }
}
