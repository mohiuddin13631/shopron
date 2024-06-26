import 'package:get/get.dart';

class ShippingAddressController extends GetxController{

  int currentIndex = 0;

  void setCurrentIndex(int index){
    currentIndex = index;
    update();
  }

}