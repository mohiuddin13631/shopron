import 'package:flutter/material.dart';

class MyColor{

  static const Color primaryColor                = Color(0xff0D6EFD);
  static const Color secondaryColor              = Color(0xffF6F7FE);
  static const Color screenBgColor               = Color(0xFFFFFFFF);
  static const Color primaryTextColor            = Color(0xff474747);
  static const Color contentTextColor            = Color(0xff777777);
  static const Color lineColor                   = Color(0xffECECEC);
  static const Color borderColor                 = Color(0xffD9D9D9);
  static const Color bodyTextColor               = Color(0xFF898989);
  static const Color iconsBackground             = Color(0xFFF9F9F9);
  static const Color backGroundScreenColor       = colorLightGrey;
  static const Color naturalLight   = Color(0xffA1ACB2);

  static const Color naturalDark2   = Color(0xff5C6670);

  static const Color titleColor                  = Color(0xff474747);
  static const Color labelTextColor              = Color(0xff444444);
  static const Color smallTextColor1             = Color(0xff555555);

  static const Color appBarColor                 = primaryColor;
  static const Color appBarContentColor          = colorWhite;

  static const Color lineThroughColor          =  bodyTextColor;

  static const Color textFieldDisableBorderColor = Color(0xffCFCEDB);
  static const Color textFieldEnableBorderColor  = primaryColor;
  static const Color hintTextColor               = Color(0xff98a1ab);

  static const Color primaryButtonColor          = primaryColor;
  static const Color primaryButtonTextColor      = colorWhite;
  static const Color secondaryButtonColor        = colorWhite;
  static const Color secondaryButtonTextColor    = colorBlack;
  static const Color trackOrderIconBgColor       = Color(0xffFCE2DB);

  static const Color iconColor                   = Color(0xff555555);
  static const Color filterEnableIconColor       = primaryColor;
  static const Color filterIconColor             = iconColor;
  static const Color cartSubtitleColor           = iconColor;

  static const Color colorWhite                  = Color(0xffFFFFFF);
  static const Color colorBlack                  = Color(0xff262626);
  static const Color colorGreen                  = Color(0xff28C76F);
  static const Color colorRed                    = Color(0xFFD92027);
  static const Color colorGrey                   = Color(0xff555555);
  static const Color colorLightGrey              = Color(0xffF2F2F2);
  static const Color colorOrange                 = Color(0xffF2994A);
  static const Color transparentColor            = Colors.transparent;

  static const Color greenSuccessColor           = greenP;
  static const Color redCancelTextColor          = Color(0xFFF93E2C);
  static const Color highPriorityPurpleColor     = Color(0xFF7367F0);
  static const Color pendingColor                = Colors.orange;

  static const Color greenP                      = Color(0xFF28C76F);
  static const Color containerBgColor            = Color(0xffF9F9F9);
  static const Color stockTextColor              = Color(0xff19BC5A);
  static const Color paidContentColor            = Color(0xff1EC892);
  static const Color deliveryTextColor           = Color(0xff0BD236);
  static const Color canceledTextColor           = Color(0xffED1F23);
  static const Color inProgressTextColor         = Color(0xffFFA500);
  static const Color unpaidColor                 = Color(0xff5F6FFF);
  static const Color trackOrderInactiveIconColor = Color(0xffD3D1D1);


  static Color getPrimaryColor(){
    return primaryColor;
  }

  static Color getScreenBgColor(){
    return screenBgColor;
  }

  static Color getGreyText(){
    return  MyColor.colorBlack.withOpacity(0.5);
  }

  static Color getAppBarColor(){
    return appBarColor;
  }
  static Color getAppBarContentColor(){
    return appBarContentColor;
  }

  static Color getHeadingTextColor(){
    return primaryTextColor;
  }

  static Color getContentTextColor(){
    return contentTextColor;
  }

  static Color getLabelTextColor(){
    return labelTextColor;
  }

  static Color getHintTextColor(){
    return hintTextColor;
  }

  static Color getTextFieldDisableBorder(){
    return textFieldDisableBorderColor;
  }

  static Color getTextFieldEnableBorder(){
    return textFieldEnableBorderColor;
  }

  static Color getPrimaryButtonColor(){
    return primaryButtonColor;
  }

  static Color getPrimaryButtonTextColor(){
    return primaryButtonTextColor;
  }

  static Color getSecondaryButtonColor(){
    return secondaryButtonColor;
  }

  static Color getSecondaryButtonTextColor(){
    return secondaryButtonTextColor;
  }

  static Color getIconColor(){
    return iconColor;
  }

  static Color getFilterDisableIconColor(){
    return filterIconColor;
  }

  static Color getSearchEnableIconColor(){
    return colorRed;
  }

  static Color getTransparentColor(){
    return transparentColor;
  }

  static Color getTextColor(){
    return colorBlack;
  }

  static Color getCardBgColor(){
    return colorWhite;
  }

  static List<Color>symbolPlate = [
  const Color(0xffDE3163),
  const Color(0xffC70039),
  const Color(0xff900C3F),
  const Color(0xff581845),
  const Color(0xffFF7F50),
  const Color(0xffFF5733),
  const Color(0xff6495ED),
  const Color(0xffCD5C5C),
  const Color(0xffF08080),
  const Color(0xffFA8072),
  const Color(0xffE9967A),
  const Color(0xff9FE2BF),
  ];

  static getSymbolColor(int index) {
     int colorIndex = index>10?index%10:index;
     return symbolPlate[colorIndex];
  }

}