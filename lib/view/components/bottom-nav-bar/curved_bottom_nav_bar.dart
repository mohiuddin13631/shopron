import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/core/utils/my_images.dart';
import 'package:flutter_prime/view/components/bottom-nav-bar/widget/custom_nav_bar_icon.dart';
import 'package:flutter_prime/view/screens/my_cart/my_cart_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/dimensions.dart';
import '../../screens/bottom_nav_section/home/home_screen.dart';
class CurvedBottomNavBar extends StatefulWidget {
  const CurvedBottomNavBar({super.key});

  @override
  _CurvedBottomNavBarState createState() => _CurvedBottomNavBarState();
}

class _CurvedBottomNavBarState extends State<CurvedBottomNavBar> {
  int _page = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const MyCartScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: Dimensions.space60,
          items: const <Widget>[
            CustomNavBarIcon(svgImage: MyImages.home),
            CustomNavBarIcon(svgImage: MyImages.card),
            CustomNavBarIcon(svgImage: MyImages.trophy),
            CustomNavBarIcon(svgImage: MyImages.navBarUser),
          ],

          color: MyColor.primaryColor,
          buttonBackgroundColor: MyColor.primaryColor,
          backgroundColor:  MyColor.colorWhite,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: Dimensions.navBarAnimationMilliseconds),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body:screens[_page]
    );
  }
}

