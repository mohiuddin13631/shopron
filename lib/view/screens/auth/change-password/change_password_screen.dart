import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:get/get.dart';

import '../../../../core/utils/my_color.dart';
import '../../../../core/utils/my_strings.dart';
import '../../../../data/controller/account/change_password_controller.dart';
import '../../../../data/repo/account/change_password_repo.dart';
import '../../../../data/services/api_service.dart';
import 'widget/change_password_form.dart';

class ChangePasswordScreen extends StatefulWidget {

  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {

  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(ChangePasswordRepo(apiClient: Get.find()));
    final controller = Get.put(ChangePasswordController(changePasswordRepo: Get.find()));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.clearData();
    });
  }

  @override
  void dispose() {
    Get.find<ChangePasswordController>().clearData();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: MyColor.screenBgColor,
      appBar: CustomAppBar(isShowBackBtn: true, title: MyStrings.changePassword.tr, bgColor: MyColor.primaryColor),
      body: GetBuilder<ChangePasswordController>(
        builder: (controller) => SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  MyStrings.createNewPassword.tr,
                  style: regularExtraLarge.copyWith(color: MyColor.getTextColor(), fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 12),

                Padding(
                  padding: EdgeInsetsDirectional.only(end: MediaQuery.of(context).size.width*0.3),
                  child: Text(
                    MyStrings.createPasswordSubText.tr,
                    style: regularDefault.copyWith(color: MyColor.getTextColor().withOpacity(0.8)),
                  ),
                ),
                const SizedBox(height: 50),

                const ChangePasswordForm()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
