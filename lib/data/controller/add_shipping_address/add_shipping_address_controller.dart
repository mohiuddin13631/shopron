import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddShippingAddressController extends GetxController{

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController  = TextEditingController();
  TextEditingController mobileController    = TextEditingController();
  TextEditingController emailController     = TextEditingController();
  TextEditingController countryController   = TextEditingController();
  TextEditingController cityController      = TextEditingController();
  TextEditingController stateController     = TextEditingController();
  TextEditingController zipController       = TextEditingController();
  TextEditingController addressController   = TextEditingController();

  FocusNode firstNameFocusNode = FocusNode();
  FocusNode lastNameFocusNode  = FocusNode();
  FocusNode mobileFocusNode    = FocusNode();
  FocusNode emailFocusNode     = FocusNode();
  FocusNode countryFocusNode   = FocusNode();
  FocusNode cityFocusNode      = FocusNode();
  FocusNode stateFocusNode     = FocusNode();
  FocusNode zipFocusNode       = FocusNode();
  FocusNode addressFocusNode   = FocusNode();


}