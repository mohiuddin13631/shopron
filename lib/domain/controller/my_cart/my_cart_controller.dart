import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyCartController extends GetxController{

  TextEditingController couponCodeController = TextEditingController();
  FocusNode couponCodeFocusNode              = FocusNode();

  int productSize = 6;

  double productPrice = 245.00;
  int quantity = 1;

  double subTotal = 548.0;

  void increaseQuantity(){
    quantity+=1;
    update();
  }

  void decreaseQuantity(){
    if(quantity > 1){
      quantity--;
    }
    update();
  }

}