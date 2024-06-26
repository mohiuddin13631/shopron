import 'package:flutter/cupertino.dart';
import 'package:shopron/config/utils/my_images.dart';
import 'package:get/get.dart';

import '../../model/general_setting/general_setting_response_model.dart';

class OnboardController extends GetxController{

  int currentIndex = 0;
  PageController pageController = PageController();

  void changeCurrentIndex(int index){
    currentIndex = index;
    update();
  }
  List<String> onboardContentList = [];

  bool isLoading = true;

  GeneralSettingResponseModel generalSettingResponseModel = GeneralSettingResponseModel();

  List<String> onBoardImage = [];


  List<String> onboardImageList = [
    MyImages.onboardImage_1,
    MyImages.onboardImage_2,
    MyImages.onboardImage_3,
  ];

  List<String> onboardSubTitleList = [
    "Your One-Stop Destination for All Your Shopping Needs",
    "Exclusive Offers and Discounts Await You",
    "Effortless Shopping at Your Fingertips",
  ];

  List<String> onboardTitleList = [
    "Welcome to Shopron",
    "Discover Amazing Deals",
    "Shop Smart, Shop Easy",
  ];
}