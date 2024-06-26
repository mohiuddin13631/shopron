import 'dart:ui';

import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/domain/controller/home/home_controller.dart';
import 'package:get/get.dart';

import '../../../config/utils/my_images.dart';

class ProductDetailsController extends GetxController{

  final HomeController homeController = Get.find();

  int currentIndex = 0;

  int totalRating = 214;

  int totalStock = 1454;

  String overViewText = "Running sneakers These are designed for high-impact activities such as running and jogging. They typically feature a cushioned midsole for comfort and support, as well as a durable outsole for traction.";

  String userComments = "Good shoe easy comfortable, good quality and light weighted for a good price tag as well. was delivered within two days";

  List<String> productColorName = ["Red","Yellow","Black","Green"];

  List<Color> productColor = [MyColor.colorRed,MyColor.colorOrange,MyColor.colorBlack,MyColor.colorGreen,];

  List<String> productDesign = [MyImages.snickers,MyImages.snickers,MyImages.snickers,MyImages.snickers,];

  int selectColorIndex = 0;

  List<int> reviewPercentage = [56,85,40,70,10];
  List<double> numberOfStar = [5,4,3,2,1];

  void setSelectedColor(int index){
    selectColorIndex = index;
    update();
  }

  double productPrice(){
    return homeController.productPrice;
  }

  setCurrentIndex(int index){
    currentIndex = index;
    update();
  }

  final List<String> imageList = [
    MyImages.productDetails,
    MyImages.headphoneBanner,
    MyImages.productDetails,
  ];

}