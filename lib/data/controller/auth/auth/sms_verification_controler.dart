import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter_prime/core/route/route.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/data/model/authorization/authorization_response_model.dart';
import 'package:flutter_prime/data/model/global/response_model/response_model.dart';
import 'package:flutter_prime/data/repo/auth/sms_email_verification_repo.dart';
import 'package:flutter_prime/view/components/snack_bar/show_custom_snackbar.dart';

class SmsVerificationController extends GetxController {

  SmsEmailVerificationRepo repo;
  SmsVerificationController({required this.repo});

  bool hasError = false;
  bool isLoading = true;
  String currentText='';
  bool isProfileCompleteEnable=false;



  Future<void> loadBefore() async {
    isLoading=true;
    update();
    await repo.sendAuthorizationRequest();
    isLoading=false;
    update();
    return;
  }


  bool submitLoading=false;
  verifyYourSms(String currentText) async {


    if (currentText.isEmpty) {
      CustomSnackBar.error(errorList: [MyStrings.otpFieldEmptyMsg.tr]);
      return;
    }

    submitLoading = true;
    update();

    ResponseModel responseModel = await repo.verify(currentText, isEmail: false, isTFA: false);

    if (responseModel.statusCode == 200) {
      AuthorizationResponseModel model = AuthorizationResponseModel.fromJson(jsonDecode(responseModel.responseJson));

      if (model.status == MyStrings.success) {

        CustomSnackBar.success(successList: model.message?.success??['${MyStrings.sms.tr} ${MyStrings.verificationSuccess.tr}']);
        Get.offAndToNamed(isProfileCompleteEnable? RouteHelper.profileCompleteScreen:RouteHelper.bottomNavBar);

      } else {
        CustomSnackBar.error(errorList: model.message?.error??['${MyStrings.sms.tr} ${MyStrings.verificationFailed}']);
      }
    } else {
      CustomSnackBar.error(errorList: [responseModel.message]);
    }

    submitLoading = false;
    update();
  }

  bool resendLoading=false;
  Future<void> sendCodeAgain() async {
    resendLoading=true;
    update();
    await repo.resendVerifyCode(isEmail: false);
    resendLoading=false;
    update();
  }
}