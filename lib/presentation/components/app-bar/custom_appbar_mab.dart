import 'package:flutter/material.dart';
import 'package:shopron/domain/controller/home/home_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:shopron/config/route/route.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/config/utils/style.dart';
import 'package:shopron/domain/services/api_service.dart';
import 'package:shopron/presentation/components/app-bar/action_button_icon_widget.dart';
import 'package:shopron/presentation/components/dialog/exit_dialog.dart';

import '../../../config/utils/dimensions.dart';


class CustomAppBarWithMAB extends StatefulWidget implements PreferredSizeWidget{

  // final HomeController? controller;

  final String title;
  final bool isShowBackBtn;
  final Color bgColor;
  final bool isShowActionBtn;
  final bool isTitleCenter;
  final bool fromAuth;
  final bool isProfileCompleted;
  final VoidCallback? actionPress1;
  final VoidCallback? actionPress2;
  final bool isActionIconAlignEnd;
  final String actionText;
  final bool isActionImage;
  final String? leadingImage;
  final String? actionImage1;
  final String? actionImage2;
  final dynamic actionIcon1;
  final dynamic actionIcon2;
  final bool leadingDrawer;
  final VoidCallback? drawerClick;

  const CustomAppBarWithMAB({Key? key,
    this.isProfileCompleted=false,
    this.fromAuth = false,
    this.isTitleCenter = false,
    this.bgColor = MyColor.primaryColor,
    this.isShowBackBtn=true,
    required this.title,
    this.isShowActionBtn=false,
    this.actionText = '',
    this.actionPress1,
    this.actionPress2,
    this.isActionIconAlignEnd = false,
    this.isActionImage = true,
    this.leadingImage,
    this.actionImage1,
    this.actionImage2,
    this.actionIcon1,
    this.actionIcon2,
    // this.controller,
    this.leadingDrawer = false,
    this.drawerClick

  }) : super(key: key);

  @override
  State<CustomAppBarWithMAB> createState() => _CustomAppBarWithMABState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}

class _CustomAppBarWithMABState extends State<CustomAppBarWithMAB> {
  bool hasNotification =false;
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isShowBackBtn?AppBar(
      elevation: 0,
      titleSpacing: 0,
      leading:widget.isShowBackBtn?IconButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: widget.drawerClick ?? (){
        if(widget.fromAuth){
          Get.offAllNamed(RouteHelper.loginScreen);
        }else if(widget.isProfileCompleted){
          showExitDialog(Get.context!);
        }else if(widget.leadingDrawer){
          widget.drawerClick;
        }
        else{
          String previousRoute=Get.previousRoute;
          if(previousRoute=='/splash-screen'){
            Get.offAndToNamed(RouteHelper.bottomNavBar);
          }else{
            Get.back();
          }
        }
      },icon: widget.leadingImage != null? SvgPicture.asset(widget.leadingImage!): Icon(Icons.arrow_back,color: MyColor.getAppBarContentColor(), size: Dimensions.space20)):const SizedBox.shrink(),
      backgroundColor: widget.bgColor,
      title: Text(widget.title.tr,style: titleText),
      centerTitle: widget.isTitleCenter,
      actions: [
        // ActionButtonIconWidget(
        //   pressed: widget.actionPress1!,
        //   isImage: widget.isActionImage,
        //   icon: widget.actionIcon1??Icons.search,  //just for demo purpose we put it here
        //   imageSrc: widget.actionImage1 ?? "",
        //   spacing: Dimensions.space12,
        //   size: Dimensions.space22,
        // ),
        ActionButtonIconWidget(
            pressed: widget.actionPress2!,
            isImage: widget.isActionImage,
            icon: widget.actionIcon2??Icons.favorite,  //just for demo purpose we put it here
            imageSrc: widget.actionImage2 ?? "",
            spacing: Dimensions.space12,
            size: Dimensions.space22
        ),
        const SizedBox(
          width: 5,
        )
      ],
    ):AppBar(
      titleSpacing: 0,
      elevation: 0,
      backgroundColor: widget.bgColor,
      title:Text(widget.title.tr,style: regularLarge.copyWith(color: MyColor.getTextColor())),
      actions: [
        widget.isShowActionBtn?InkWell(onTap: (){Get.toNamed(RouteHelper.notificationScreen)?.then((value){
          setState(() {
            hasNotification=false;
          });
        });},child:const SizedBox.shrink()):const SizedBox()
      ],
      automaticallyImplyLeading: false,
    );
  }
}
