import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shopron/config/route/route.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/config/utils/style.dart';
import 'package:shopron/domain/services/api_service.dart';
import 'package:shopron/presentation/components/app-bar/action_button_icon_widget.dart';
import 'package:shopron/presentation/components/dialog/exit_dialog.dart';

import '../../../config/utils/dimensions.dart';


class CustomAppBar extends StatefulWidget implements PreferredSizeWidget{

  final String title;
  final bool isShowBackBtn;
  final Color bgColor;
  final bool isShowSingleActionBtn;
  final bool isTitleCenter;
  final bool fromAuth;
  final bool isProfileCompleted;
  final dynamic actionIcon;
  final VoidCallback? actionPress;
  final bool isActionIconAlignEnd;
  final String actionText;
  final bool isActionImage;
  final String? leadingImage;
  final String? actionImage;
  // final bool isShowMultipleActionButton;

  const  CustomAppBar({Key? key,
    this.isProfileCompleted=false,
    this.fromAuth = false,
    this.isTitleCenter = false,
    this.bgColor = MyColor.primaryColor,
    this.isShowBackBtn=true,
    required this.title,
    this.isShowSingleActionBtn=false,
    this.actionText = '',
    this.actionIcon,
    this.actionPress,
    this.isActionIconAlignEnd = false,
    this.isActionImage = true,
    this.leadingImage,
    this.actionImage

  }) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 50);
}

class _CustomAppBarState extends State<CustomAppBar> {
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
        onPressed: (){

        if(widget.fromAuth){
          Get.offAllNamed(RouteHelper.loginScreen);
        }else if(widget.isProfileCompleted){
          showExitDialog(Get.context!);
        }
        else{
          String previousRoute=Get.previousRoute;
          if(previousRoute=='/splash-screen'){
            Get.offAndToNamed(RouteHelper.bottomNavBar);
          }else{
            Get.back();
          }
        }
      },icon: widget.leadingImage != null? SvgPicture.asset(widget.leadingImage!): Icon(Icons.arrow_back,color: MyColor.getAppBarContentColor(), size: 20)):const SizedBox.shrink(),
      backgroundColor: widget.bgColor,
      title: Text(widget.title.tr,style: titleText),
      centerTitle: widget.isTitleCenter,
      actions: [
        widget.isShowSingleActionBtn
            ? ActionButtonIconWidget(
          pressed: widget.actionPress!,
          isImage: widget.isActionImage,
          icon: widget.isActionImage?Icons.add:widget.actionIcon,  //just for demo purpose we put it here
          // imageSrc: widget.isActionImage?widget.actionIcon:'',
          imageSrc: widget.actionImage ?? "",
        ) : const SizedBox.shrink(),
        const SizedBox(
          width: 5,
        )
      ],
    ):AppBar(
      titleSpacing: 0,
      elevation: 0,
      backgroundColor: widget.bgColor,
      title:Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Text(widget.title.tr,style: semiBoldLargeInter.copyWith(color: MyColor.colorWhite)),
      ),
      actions: [
        ActionButtonIconWidget(
          pressed: widget.actionPress,
          isImage: widget.isActionImage,
          icon: widget.actionIcon??Icons.search,  //just for demo purpose we put it here
          imageSrc: widget.actionImage ?? "",
          spacing: Dimensions.space14,
          size: Dimensions.space22,
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }


}
