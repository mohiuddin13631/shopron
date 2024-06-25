import 'package:flutter_prime/view/components/bottom-nav-bar/curved_bottom_nav_bar.dart';
import 'package:flutter_prime/view/screens/Profile/profile_screen.dart';
import 'package:flutter_prime/view/screens/add_shipping_address/add_shipping_address_screen.dart';
import 'package:flutter_prime/view/screens/auth/email_verification_page/email_verification_screen.dart';
import 'package:flutter_prime/view/screens/auth/forget_password/forget_password/forget_password.dart';
import 'package:flutter_prime/view/screens/auth/forget_password/reset_password/reset_password_screen.dart';
import 'package:flutter_prime/view/screens/auth/forget_password/verify_forget_password/verify_forget_password_screen.dart';
import 'package:flutter_prime/view/screens/auth/kyc/kyc.dart';
import 'package:flutter_prime/view/screens/auth/login/login_screen.dart';
import 'package:flutter_prime/view/screens/auth/profile_complete/profile_complete_screen.dart';
import 'package:flutter_prime/view/screens/auth/registration/registration_screen.dart';
import 'package:flutter_prime/view/screens/auth/sms_verification_page/sms_verification_screen.dart';
import 'package:flutter_prime/view/screens/auth/two_factor_screen/two_factor_verification_screen.dart';
import 'package:flutter_prime/view/screens/bottom_nav_section/home/home_screen.dart';
import 'package:flutter_prime/view/screens/check_out/check_out_screen.dart';
import 'package:flutter_prime/view/screens/faq/faq_screen.dart';
import 'package:flutter_prime/view/screens/mens_fashion/mens_fashion_screen.dart';
import 'package:flutter_prime/view/screens/menu/menu_screen.dart';
import 'package:flutter_prime/view/screens/my_cart/my_cart_screen.dart';
import 'package:flutter_prime/view/screens/my_cart/widget/bottom_nav_bar.dart';
import 'package:flutter_prime/view/screens/my_order/my_order_screen.dart';
import 'package:flutter_prime/view/screens/my_review/my_review_screen.dart';
import 'package:flutter_prime/view/screens/notification/notification_screen.dart';
import 'package:flutter_prime/view/screens/payment_log/payment_log_screen.dart';
import 'package:flutter_prime/view/screens/product_details/product_details_screen.dart';
import 'package:flutter_prime/view/screens/shipping_address/shipping_address_screen.dart';
import 'package:flutter_prime/view/screens/splash/splash_screen.dart';
import 'package:flutter_prime/view/screens/track_order/track_order_screen.dart';
import 'package:flutter_prime/view/screens/wish_list/wish_list_screen.dart';
import 'package:get/get.dart';

import '../../view/screens/auth/change-password/change_password_screen.dart';
import '../../view/screens/top_brand/top_brand_screen.dart';



class RouteHelper{

static const String splashScreen                = "/splash_screen";
static const String homeScreen                  = "/home_screen";
static const String menuScreen                  = "/menu_screen";
static const String curvedBottomNavBar          = "/curved_bottom_nav_bar";
static const String productDetailsScreen        = "/produce_details";
static const String myCartScreen                = "/my_cart_screen";
static const String bottomNavBar                = "/bottom_nav_bar";
static const String checkOutScreen              = "/check_out_screen";
static const String shippingAddressScreen       = "/shipping_address";
static const String addShippingAddressScreen    = "/add_shipping_address";
static const String wishListScreen              = "/wish_list_screen";
static const String mensFashionScreen           = "/mens_fashion_screen";
static const String topBrandScreen              = "/top_brand_screen";
static const String paymentLogScreen            = "/payment_log_screen";
static const String myOrderScreen               = "/myOrder_screen";
static const String myReviewScreen              = "/my_review_screen";
static const String trackOrderScreen            = "/track_order_screen";
static const String faqScreen                   = "/faq_screen";


static const String onboardScreen               = "/onboard_screen";
static const String loginScreen                 = "/login_screen";
static const String forgotPasswordScreen        = "/forgot_password_screen";
static const String changePasswordScreen        = "/change_password_screen";
static const String registrationScreen          = "/registration_screen";
// static const String bottomNavBar                = "/bottom_nav_bar";
static const String myWalletScreen              = "/my_wallet_screen";
static const String addMoneyHistoryScreen       = "/add_money_history_screen";
static const String profileCompleteScreen       = "/profile_complete_screen";
static const String emailVerificationScreen     = "/verify_email_screen" ;
static const String smsVerificationScreen       = "/verify_sms_screen";
static const String verifyPassCodeScreen        = "/verify_pass_code_screen" ;
static const String twoFactorScreen             = "/two-factor-screen";
static const String resetPasswordScreen         = "/reset_pass_screen" ;
static const String transactionHistoryScreen    = "/transaction_history_screen";
static const String notificationScreen          = "/notification_screen";
static const String profileScreen               = "/profile_screen";
static const String editProfileScreen           = "/edit_profile_screen";
static const String kycScreen                   = "/kyc_screen";
static const String privacyScreen               = "/privacy-screen";

static const String withdrawScreen              = "/withdraw-screen";
static const String addWithdrawMethodScreen     = "/withdraw-method";
static const String withdrawConfirmScreenScreen = "/withdraw-preview-screen";


static const String depositsScreen              = "/deposits";
static const String depositsDetailsScreen       = "/deposits_details";
static const String newDepositScreenScreen      = "/deposits_money";
static const String depositWebViewScreen        = '/deposit_webView';


  List<GetPage> routes = [

    GetPage(name: splashScreen        ,         page: () => const SplashScreen()),
    GetPage(name: loginScreen         ,         page: () => const LoginScreen()),
    GetPage(name: homeScreen          ,         page: () => const HomeScreen()),
    GetPage(name: menuScreen          ,         page: () => const MenuScreen()),
    GetPage(name: myCartScreen          ,       page: () => const MyCartScreen()),
    // GetPage(name: curvedBottomNavBar  ,      page: () => const CurvedBottomNavBar()),
    GetPage(name: productDetailsScreen    , page: () => const ProductDetailsScreen()),
    GetPage(name: bottomNavBar            , page: () => const BottomNavBar()),
    GetPage(name: checkOutScreen          , page: () => const CheckOutScreen()),
    GetPage(name: shippingAddressScreen   , page: () => const ShippingAddressScreen()),
    GetPage(name: addShippingAddressScreen, page: () => const AddShippingAddressScreen()),
    GetPage(name: wishListScreen          , page: () => const WishListScreen()),
    GetPage(name: mensFashionScreen       , page: () => const MensFashionScreen()),
    GetPage(name: topBrandScreen          , page: () => const TopBrandScreen()),
    GetPage(name: paymentLogScreen        , page: () => const PaymentLogScreen()),
    GetPage(name: myOrderScreen           , page: () => const MyOrderScreen()),
    GetPage(name: myReviewScreen          , page: () => const MyReviewScreen()),
    GetPage(name: trackOrderScreen        , page: () => const TrackOrderScreen()),


    GetPage(name: forgotPasswordScreen,         page: () => const ForgetPasswordScreen()),

    GetPage(name: registrationScreen,           page: () => const RegistrationScreen()),
    GetPage(name: profileCompleteScreen,        page: () => const ProfileCompleteScreen()),
    // GetPage(name: bottomNavBar,                 page: () => const BottomNavBar()),

    GetPage(name: profileScreen,                page: () => const ProfileScreen()),
    GetPage(name: kycScreen,                    page: () => const KycScreen()),

    GetPage(name: emailVerificationScreen,      page: () => EmailVerificationScreen(needSmsVerification: Get.arguments[0],isProfileCompleteEnabled: Get.arguments[1],needTwoFactor: Get.arguments[2],)),
    GetPage(name: smsVerificationScreen,        page: () => const SmsVerificationScreen()),
    GetPage(name: verifyPassCodeScreen,         page: () => const VerifyForgetPassScreen()),
    GetPage(name: resetPasswordScreen,          page: () => const ResetPasswordScreen()),
    GetPage(name: twoFactorScreen,              page: () => TwoFactorVerificationScreen(isProfileCompleteEnable: Get.arguments)),

    GetPage(name: kycScreen,                    page: () => const KycScreen()),
    GetPage(name: faqScreen,                    page: () => const FaqScreen()),
    GetPage(name: changePasswordScreen,         page: () => const ChangePasswordScreen()),
    GetPage(name: notificationScreen,           page: () => const NotificationScreen()),


    // GetPage(name: withdrawScreen,               page: () => const WithdrawScreen()),
    // GetPage(name: addWithdrawMethodScreen,      page: () => const AddWithdrawMethod()),
    // GetPage(name: withdrawConfirmScreenScreen,  page: () => const WithdrawConfirmScreen()),
    // GetPage(name: privacyScreen,                page: () => const PrivacyPolicyScreen()),
    // GetPage(name: editProfileScreen,            page: () => const EditProfileScreen()),
    // GetPage(name: transactionHistoryScreen,     page: () => const TransactionsScreen()),
    // GetPage(name: depositWebViewScreen,         page: () => MyWebViewScreen(redirectUrl: Get.arguments)),
    // GetPage(name: depositsScreen,               page: () => const DepositsScreen()),
    // GetPage(name: newDepositScreenScreen,       page: () => const NewDepositScreen()),
  ];
}