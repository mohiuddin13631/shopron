import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/style.dart';

import 'dimensions.dart';
import 'my_color.dart';

class AppTheme {
  static ThemeData lightThemeData = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: MyColor.primaryColor,
    brightness: Brightness.light,
    scaffoldBackgroundColor: MyColor.screenBgColor,
    hintColor: MyColor.naturalDark2,
    buttonTheme: const ButtonThemeData(
      buttonColor: MyColor.primaryColor,
    ),
    tabBarTheme: TabBarTheme(

      dividerColor: Colors.transparent,
      // indicator: BoxDecoration(
      //   color: MyColor.tabBarTabColor,
      //   borderRadius: BorderRadius.circular(Dimensions.cardRadius),
      //   border: Border.all(
      //     color: MyColor.tabBarTabColor,
      //   ),
      // ),
      indicatorSize: TabBarIndicatorSize.tab,
      labelStyle: boldDefault.copyWith(
        fontSize: Dimensions.fontLarge,
      ),
      unselectedLabelColor: MyColor.colorLightGrey, //todo
      unselectedLabelStyle: regularLarge.copyWith(fontSize: Dimensions.fontLarge),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimensions.defaultCardRadius,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space2, horizontal: Dimensions.space5),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            Dimensions.defaultCardRadius,
          ),
        ),
        elevation: 1,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space2, horizontal: Dimensions.space5),
      ),
    ),
    cardColor: MyColor.colorBlack,
    appBarTheme: AppBarTheme(
      backgroundColor: MyColor.primaryColor,
      surfaceTintColor: MyColor.colorWhite,
      elevation: 0,
      titleTextStyle: regularLarge.copyWith(color: MyColor.colorWhite),
      iconTheme: const IconThemeData(size: 20, color: MyColor.colorWhite)
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all(MyColor.colorBlack),
      fillColor: MaterialStateProperty.all(MyColor.transparentColor),
    ),
  );
}