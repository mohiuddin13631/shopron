import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shopron/config/helper/shared_preference_helper.dart';
import 'package:shopron/config/route/route.dart';
import 'package:shopron/config/utils/messages.dart';
import 'package:shopron/config/utils/my_strings.dart';
import 'package:shopron/config/utils/theme_data.dart';
import 'package:shopron/domain/controller/localization/localization_controller.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/di_service/di_services.dart' as di_service;

Future<void> _messageHandler(RemoteMessage message) async {
  // await Firebase.initializeApp();
  final sharedPreferences=await SharedPreferences.getInstance();
  Get.lazyPut(()=>sharedPreferences);
  sharedPreferences.setBool(SharedPreferenceHelper.hasNewNotificationKey, true);
}

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Map<String, Map<String, String>> languages = await di_service.init();

  // FirebaseMessaging.onBackgroundMessage(_messageHandler);
  // await PushNotificationService().setupInteractedMessage();

  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp(languages: languages));

}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

class MyApp extends StatefulWidget {

  final Map<String, Map<String, String>> languages;
  const MyApp({Key? key,required this.languages}):super(key:key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(
      builder: (localizeController) => GetMaterialApp(
        title: MyStrings.appName,
        debugShowCheckedModeBanner: false,
        defaultTransition: Transition.noTransition,
        transitionDuration: const Duration(milliseconds: 200),
        initialRoute: RouteHelper.splashScreen,
        theme: AppTheme.lightThemeData,
        // initialRoute: RouteHelper.loginScreen,
        navigatorKey: Get.key,
        getPages: RouteHelper().routes,
        locale: localizeController.locale,
        translations: Messages(languages: widget.languages),
        fallbackLocale: Locale(localizeController.locale.languageCode,
        localizeController.locale.countryCode),
      ),
    );
  }
}
