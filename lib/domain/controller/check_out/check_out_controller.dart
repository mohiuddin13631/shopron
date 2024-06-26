import 'package:get/get.dart';

class CheckOutController extends GetxController{

  double subTotal = 280;
  double discount = 03;
  double deliveryFee = 30;
  double vat = 40;
  double total = 2548;

  int currentPayment = 1;
  int currentShipping = 1;

  List<String> paymentMethode = ["Apple Pay","Google Pay","Stripe","Amazon Pay"];

  List<String> shippingMethode = ["Inside City","Outside City","International","In-Store Pickup"];

  void setPaymentMethode(int index){
    currentPayment = index;
    update();
  }

  void setCurrentShipping(int index){
    currentShipping = index;
    update();
  }

}