import 'dart:convert';
import 'package:get/get.dart';

class FaqController extends GetxController{


  bool isLoading = true;
  bool isPress = false;
  int selectedIndex = -1;

  List<String> faqQuestionList = [
    "How can I track my order?",
    "What is your return policy?",
    "How do I contact customer support?",
    "How do I apply a discount code to my order?",
    "Can I change or cancel my order after it's been placed?",
    "What payment methods do you accept?"
  ];
  List<String> faqAnswerList = [
    "To track your order, log in to your account, go to the 'My Orders' section, select the order you want to track, and click on 'Track Order.' You'll see the current status and estimated delivery date. Additionally, we send email and SMS updates at key stages of your delivery.",
    "Our return policy allows you to return most items within 30 days of delivery for a full refund or exchange. The item must be in its original condition with tags and packaging. To initiate a return, log in, go to 'My Orders,' select the order, and follow the return instructions provided.",
    "You can contact customer support via the in-app chat feature or email us at support@ecommerceapp.com. For quick answers, visit our 'Help Center' in the app, where we have a comprehensive list of FAQs and troubleshooting tips.",
    "To apply a discount code, add the items you want to purchase to your cart and proceed to checkout. On the checkout page, you'll find a field labeled 'Discount Code' or 'Promo Code.' Enter your code in this field and click 'Apply.' The discount will be deducted from your total.",
    "Once an order is placed, you have a limited time to make changes or cancel it before it is processed. To modify or cancel your order, go to the 'My Orders' section of your account, select the order, and look for the 'Edit' or 'Cancel' options. If these options are unavailable, the order has likely already been processed.",
    "We accept various payment methods, including major credit and debit cards (Visa, MasterCard, American Express), PayPal, and select mobile payment options like Apple Pay and Google Pay. You can choose your preferred payment method at checkout."
  ];

  void changeSelectedIndex(int index){
    if(selectedIndex == index){
      selectedIndex = -1;
      update();
      return;
    }
    selectedIndex = index;
    update();
  }


}