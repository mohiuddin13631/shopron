import 'package:flutter/material.dart';
import 'package:flutter_prime/view/components/buttons/custom_rounded_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
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
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:flutter_prime/view/components/custom_loader/custom_loader.dart';
import 'package:flutter_prime/view/components/custom_no_data_found_class.dart';
import 'package:flutter_prime/view/components/will_pop_widget.dart';
import 'package:flutter_prime/view/screens/auth/registration/widget/registration_form.dart';

import '../../../../data/controller/auth/login_controller.dart';
import '../../../../data/repo/auth/login_repo.dart';
import '../../../components/buttons/rounded_button.dart';
import '../../../components/buttons/rounded_loading_button.dart';
import '../../../components/text-form-field/custom_text_field.dart';
import '../../../components/text/default_text.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {


    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(LoginRepo(apiClient: Get.find()));
    Get.put(LoginController(loginRepo: Get.find()));

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<LoginController>().remember = false;
    });

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return GetBuilder<LoginController>(
      builder: (controller) => WillPopWidget(
        nextRoute: RouteHelper.loginScreen,
        child: Scaffold(
          backgroundColor: MyColor.getScreenBgColor(),
          body: SingleChildScrollView(
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
                            Text(MyStrings.welcomeBack.tr,style: semiBoldLargeInter.copyWith(fontSize: Dimensions.space20)),
                            const SizedBox(height: Dimensions.space22),
                            // const RegistrationForm() ,
                            CustomTextField(
                              animatedLabel: true,
                              needOutlineBorder: true,
                              labelText: MyStrings.emailOrUserName.tr,
                              controller: controller.emailController,
                              focusNode: controller.emailFocusNode,
                              textInputType: TextInputType.text,
                              nextFocus: controller.passwordFocusNode,
                              prefixIconSvg: MyImages.person,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return MyStrings.enterYourUsername.tr;
                                } else if(value.length<6){
                                  return MyStrings.kShortUserNameError.tr;
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (value) {
                                return;
                              },
                            ),
                            const SizedBox(height: Dimensions.space12),
                            CustomTextField(
                              animatedLabel: true,
                              needOutlineBorder: true,
                              isShowSuffixIcon: true,
                              isPassword: true,
                              labelText: MyStrings.password.tr,
                              controller: controller.passwordController,
                              focusNode: controller.passwordFocusNode,
                              prefixIconSvg: MyImages.password,
                              svgIconColor: MyColor.iconColor,
                              textInputType: TextInputType.text,
                              onChanged: (value) {},
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return MyStrings.fieldErrorMsg.tr;
                                } else {
                                  return null;
                                }
                              }
                            ),
                            const SizedBox(height: Dimensions.space18),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 25,
                                      height: 25,
                                      child: Checkbox(
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.defaultRadius)),
                                          activeColor: MyColor.primaryColor,
                                          checkColor: MyColor.colorWhite,
                                          value: controller.remember,
                                          side: MaterialStateBorderSide.resolveWith(
                                                (states) => BorderSide(
                                                width: 1.0,
                                                color: controller.remember ? MyColor.getTextFieldEnableBorder() : MyColor.getTextFieldDisableBorder()
                                            ),
                                          ),
                                          onChanged: (value){
                                            controller.changeRememberMe();
                                          }
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    DefaultText(text: MyStrings.rememberMe.tr, textColor: MyColor.getTextColor())
                                  ],
                                ),
                                InkWell(
                                  onTap: (){
                                    controller.clearTextField();
                                    Get.toNamed(RouteHelper.forgotPasswordScreen);
                                  },
                                  child: DefaultText(text: MyStrings.forgotPassword.tr, textColor: MyColor.getTextColor()),
                                )
                              ],
                            ),
                            const SizedBox(height: Dimensions.space18),
                            controller.isSubmitLoading ? const RoundedLoadingBtn() : CustomRoundedButton(
                              labelName: MyStrings.signIn.tr,
                              verticalPadding: Dimensions.space12,
                              isHorizontalPadding: false,
                              press: (){
                                // if(formKey.currentState!.validate()){
                                //   controller.loginUser();
                                // }
                                Get.offAllNamed(RouteHelper.bottomNavBar);
                              }
                            ),
                            const SizedBox(height: Dimensions.space14),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(MyStrings.doNotHaveAccount.tr, overflow:TextOverflow.ellipsis,style: regularLarge.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500)),
                                const SizedBox(width: Dimensions.space5),
                                TextButton(
                                  onPressed: (){
                                    Get.offAndToNamed(RouteHelper.registrationScreen);
                                  },
                                  child: Text(MyStrings.registerNow.tr, maxLines: 2, overflow:TextOverflow.ellipsis,style: regularDefaultInter.copyWith(color: MyColor.getPrimaryColor(),decoration: TextDecoration.underline)),
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
