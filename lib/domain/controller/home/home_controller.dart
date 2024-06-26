

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../config/utils/my_images.dart';

class HomeController extends GetxController{


  int carouselCurrentIndex = 0;
  final CarouselController carouselController = CarouselController();

  final List<String> imageList = [
    MyImages.carousel,
    MyImages.headphoneBanner,
    MyImages.carousel,
  ];

  int visibleIndex = -1;

  int totalRating = 214;
  double productPrice = 280;

  List<int> productSize = [12,13,30,45];
  List<String> productSizeName = ["D","H","M","S"];

  setCurrentIndex(int index){
    carouselCurrentIndex = index;
    update();
  }

  toggleVisibility(int visibleIndex){
    if(visibleIndex==this.visibleIndex){
      this.visibleIndex = -1;
      update();
      return;
    }
    this.visibleIndex = visibleIndex;
    update();
  }

}