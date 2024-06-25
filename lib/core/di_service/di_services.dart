import 'package:flutter_prime/data/controller/check_out/check_out_controller.dart';
import 'package:flutter_prime/data/controller/home/home_controller.dart';
import 'package:flutter_prime/data/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:flutter_prime/data/controller/my_cart/my_cart_controller.dart';
import 'package:flutter_prime/data/controller/my_order/my_order_controller.dart';
import 'package:flutter_prime/data/controller/my_review/my_review_controller.dart';
import 'package:flutter_prime/data/controller/payment_log/payment_log_controller.dart';
import 'package:flutter_prime/data/controller/product_details/product_details_controller.dart';
import 'package:flutter_prime/data/controller/shipping_address/shipping_address_controller.dart';
import 'package:flutter_prime/data/controller/top_brand/top_brand_controller.dart';
import 'package:flutter_prime/data/controller/track_order/track_order_controller.dart';
import 'package:flutter_prime/data/controller/wish_list/wish_list_controller.dart';
import 'package:flutter_prime/view/screens/product_details/product_details_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_prime/data/controller/localization/localization_controller.dart';
import 'package:flutter_prime/data/controller/splash/splash_controller.dart';
import 'package:flutter_prime/data/repo/auth/general_setting_repo.dart';
import 'package:flutter_prime/data/repo/splash/splash_repo.dart';
import 'package:flutter_prime/data/services/api_service.dart';

Future<Map<String, Map<String, String>>> init()async{

  final sharedPreferences=await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences, fenix: true);
  Get.lazyPut(() => ApiClient(sharedPreferences: Get.find()));
  Get.lazyPut(() => GeneralSettingRepo(apiClient: Get.find()));
  Get.lazyPut(() => SplashRepo(apiClient: Get.find()));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));
  Get.lazyPut(() => SplashController(repo:Get.find(),localizationController: Get.find()));
  // Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => GeneralSettingRepo(apiClient: Get.find()));
  Get.lazyPut(() => LocalizationController(sharedPreferences: Get.find()));

  Get.lazyPut(() => HomeController());
  Get.lazyPut(() => ProductDetailsController());
  Get.lazyPut(() => MyCartController());
  Get.lazyPut(() => CheckOutController());
  Get.lazyPut(() => ShippingAddressController());
  Get.lazyPut(() => WishListController());
  Get.lazyPut(() => MensFashionController());
  Get.lazyPut(() => TopBrandController());
  Get.lazyPut(() => PaymentLogController());
  Get.lazyPut(() => MyOrderController());
  Get.lazyPut(() => MyReviewController());
  Get.lazyPut(() => TrackOrderController());

  Map<String,Map<String,String>> language = {};
  language['en_US'] = {'':''};

  return language;

}
