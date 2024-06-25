import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/data/controller/add_shipping_address/add_shipping_address_controller.dart';
import 'package:flutter_prime/view/components/buttons/custom_rounded_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../core/utils/my_images.dart';
import '../../../core/utils/my_strings.dart';
import '../../../data/controller/shipping_address/shipping_address_controller.dart';
import '../../components/app-bar/custom_appbar.dart';
import '../../components/text-form-field/custom_text_field.dart';
class AddShippingAddressScreen extends StatefulWidget {
  const AddShippingAddressScreen({super.key});

  @override
  State<AddShippingAddressScreen> createState() => _AddShippingAddressScreenState();
}

class _AddShippingAddressScreenState extends State<AddShippingAddressScreen> {

  @override
  void initState() {
    final controller = Get.put(AddShippingAddressController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<AddShippingAddressController>(
      builder: (controller) => Scaffold(
        backgroundColor: MyColor.colorWhite,
        appBar: const CustomAppBar(
          title: MyStrings.addShippingAddress,
          leadingImage: MyImages.backButton,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 28),
          child: Column(
            children: [
              CustomTextField(
                controller: controller.firstNameController,
                textInputType: TextInputType.name,
                focusNode: controller.firstNameFocusNode,
                nextFocus: controller.lastNameFocusNode,
                labelText: MyStrings.firstName.tr,
                animatedLabel: true,
                needOutlineBorder: true,
                onChanged: (value){},
                prefixIconSvg: MyImages.person,
                validator: (value) {
                  if(value.isEmpty){
                    return MyStrings.fieldErrorMsg.tr;
                  }
                  else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: Dimensions.space12),
              CustomTextField(
                controller: controller.lastNameController,
                textInputType: TextInputType.name,
                focusNode: controller.lastNameFocusNode,
                prefixIconSvg: MyImages.person,
                nextFocus: controller.mobileFocusNode,
                labelText: MyStrings.lastName.tr,
                animatedLabel: true,
                needOutlineBorder: true,
                onChanged: (value){},
                validator: (value) {
                  if(value.isEmpty){
                    return MyStrings.fieldErrorMsg.tr;
                  }
                  else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: Dimensions.space12,),
              CustomTextField(
                controller: controller.mobileController,
                textInputType: TextInputType.number,
                focusNode: controller.mobileFocusNode,
                nextFocus: controller.emailFocusNode,
                prefixIconSvg: MyImages.smartPhone,
                labelText: MyStrings.mobile.tr,
                animatedLabel: true,
                needOutlineBorder: true,
                onChanged: (value){},
                onSuffixTap: () {},
                validator: (value) {
                  if(value.isEmpty){
                    return MyStrings.fieldErrorMsg.tr;
                  }
                  else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: Dimensions.space12),
              CustomTextField(
                controller: controller.emailController,
                textInputType: TextInputType.emailAddress,
                focusNode: controller.emailFocusNode,
                nextFocus: controller.cityFocusNode,
                prefixIconSvg: MyImages.textFieldEmail,
                labelText: MyStrings.email.tr,
                animatedLabel: true,
                needOutlineBorder: true,
                onChanged: (value){},
                onSuffixTap: () {},
                validator: (value) {
                  if(value.isEmpty){
                    return MyStrings.fieldErrorMsg.tr;
                  }
                  else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: Dimensions.space12),
              CustomTextField(
                controller: controller.countryController,
                textInputType: TextInputType.name,
                focusNode: controller.countryFocusNode,
                nextFocus: controller.cityFocusNode,
                prefixIconSvg: MyImages.www,
                labelText: MyStrings.country.tr,
                animatedLabel: true,
                needOutlineBorder: true,
                onChanged: (value){},
                onSuffixTap: () {},
                validator: (value) {
                  if(value.isEmpty){
                    return MyStrings.fieldErrorMsg.tr;
                  }
                  else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: Dimensions.space12),
              CustomTextField(
                controller: controller.cityController,
                textInputType: TextInputType.name,
                focusNode: controller.cityFocusNode,
                nextFocus: controller.stateFocusNode,
                prefixIconSvg: MyImages.citySvg,
                labelText: MyStrings.city.tr,
                animatedLabel: true,
                needOutlineBorder: true,
                onChanged: (value){},
                onSuffixTap: () {},
                validator: (value) {
                  if(value.isEmpty){
                    return MyStrings.fieldErrorMsg.tr;
                  }
                  else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: Dimensions.space12),
              CustomTextField(
                controller: controller.stateController,
                textInputType: TextInputType.name,
                focusNode: controller.stateFocusNode,
                nextFocus: controller.zipFocusNode,
                prefixIconSvg: MyImages.stateSvg,
                labelText: MyStrings.state.tr,
                animatedLabel: true,
                needOutlineBorder: true,
                onChanged: (value){},
                onSuffixTap: () {},
                validator: (value) {
                  if(value.isEmpty){
                    return MyStrings.fieldErrorMsg.tr;
                  }
                  else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: Dimensions.space12),
              CustomTextField(
                controller: controller.zipController,
                textInputType: TextInputType.name,
                focusNode: controller.zipFocusNode,
                nextFocus: controller.addressFocusNode,
                prefixIconSvg: MyImages.zipCodeSvg,
                labelText: MyStrings.country.tr,
                animatedLabel: true,
                needOutlineBorder: true,
                onChanged: (value){},
                onSuffixTap: () {},
                validator: (value) {
                  if(value.isEmpty){
                    return MyStrings.fieldErrorMsg.tr;
                  }
                  else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: Dimensions.space12),
              CustomTextField(
                controller: controller.addressController,
                textInputType: TextInputType.name,
                focusNode: controller.addressFocusNode,
                maxLines: 6,
                prefixIconSvg: MyImages.map,
                labelText: MyStrings.address.tr,
                animatedLabel: true,
                needOutlineBorder: true,
                onChanged: (value){},
                onSuffixTap: () {},
                validator: (value) {
                  if(value.isEmpty){
                    return MyStrings.fieldErrorMsg.tr;
                  }
                  else{
                    return null;
                  }
                },
              ),
              const SizedBox(height: Dimensions.space25),
              CustomRoundedButton(labelName: MyStrings.save, press: (){},isHorizontalPadding: false),
            ],
          ),
        ),
      ),
    );
  }
}
