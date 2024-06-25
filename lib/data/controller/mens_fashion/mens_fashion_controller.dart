import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:get/get.dart';

class MensFashionController extends GetxController{

  TextEditingController searchController = TextEditingController();

  FocusNode searchFocusNode = FocusNode();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  int visibleIndex = -1;
  double productPrice = 200.00;
  int totalRating = 425;

  double rangeStartValue = 28;
  double rangeEndValue = 150;

  bool enableDiscount = false;

  int mensFashionCurrentIndex = 1;
  int brandSectionCurrentIndex = 1;
  int colorSectionCurrentIndex = 0;
  int sizeSectionCurrentIndex = 2;

  List<String> mensFashionList = ["Clothing","Glasses","Shoes","Watch"];

  List<String> brandSectionList = ["Men's Fashion","All Category","T-Shirt","Women's Fashion"];

  List<String> sizeList = ["S","M","L","XL"];

  List<Color> colorList = [MyColor.primaryColor,MyColor.colorOrange,MyColor.colorBlack,MyColor.colorGreen];

  void setMensFashionCurrentIndex(int index){
    mensFashionCurrentIndex = index;
    update();
  }

  void setBrandSectionCurrentIndex(int index){
    brandSectionCurrentIndex = index;
    update();
  }

  void setColorSectionCurrentIndex(int index){
    colorSectionCurrentIndex = index;
    update();
  }

  void setSizeSectionCurrentIndex(int index){
    sizeSectionCurrentIndex = index;
    update();
  }

  setStartAndEndValue(double startValue, double endValue){
    rangeStartValue = startValue;
    rangeEndValue = endValue;
    update();
  }

}