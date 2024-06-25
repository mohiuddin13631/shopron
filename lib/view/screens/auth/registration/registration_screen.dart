import 'package:flutter/material.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_images.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/data/controller/auth/auth/registration_controller.dart';
import 'package:flutter_prime/data/repo/auth/general_setting_repo.dart';
import 'package:flutter_prime/data/repo/auth/signup_repo.dart';
import 'package:flutter_prime/data/services/api_service.dart';
import 'package:flutter_prime/view/components/custom_loader/custom_loader.dart';
import 'package:flutter_prime/view/components/custom_no_data_found_class.dart';
import 'package:flutter_prime/view/components/will_pop_widget.dart';
import 'package:flutter_prime/view/screens/auth/registration/widget/registration_form.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  void initState() {

    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(GeneralSettingRepo(apiClient: Get.find()));
    Get.put(RegistrationRepo(apiClient: Get.find()));
    Get.put(RegistrationController(registrationRepo: Get.find(), generalSettingRepo: Get.find()));

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Get.find<RegistrationController>().initData();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return GetBuilder<RegistrationController>(
      builder: (controller) => WillPopWidget(
        nextRoute: RouteHelper.loginScreen,
        child: Scaffold(
          // appBar: AppBar(backgroundColor: MyColor.primaryColor),
          backgroundColor: MyColor.getScreenBgColor(),
          body: controller.noInternet ? NoDataOrInternetScreen(
            isNoInternet: true,
            onChanged: (value){
              controller.changeInternet(value);
            },
          ) : SingleChildScrollView(
            child: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.height * .198,
                        color: MyColor.primaryColor,
                        child: Image.asset(MyImages.backgroundShade,fit: BoxFit.cover,),
                      ),
                      const SizedBox(height: Dimensions.space60),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: Dimensions.space16),
                        child: Column(
                          children: [
                            Text(MyStrings.createAccount.tr,style: semiBoldLargeInter.copyWith(fontSize: Dimensions.space20)),
                            const SizedBox(height: Dimensions.space22),
                            const RegistrationForm() ,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(MyStrings.alreadyAccount.tr, style: regularLarge.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500)),
                                const SizedBox(width: Dimensions.space5),
                                TextButton(
                                  onPressed: (){
                                    controller.clearAllData();
                                    Get.offAndToNamed(RouteHelper.loginScreen);
                                  },
                                  child: Text(MyStrings.signIn.tr, style: regularLarge.copyWith(color: MyColor.getPrimaryColor())),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    top: size.height * .160,
                    left: MediaQuery.of(context).size.width / 2.5,
                    child: SvgPicture.asset(MyImages.loginCartIcon),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
