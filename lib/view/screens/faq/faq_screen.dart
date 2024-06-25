import 'package:flutter/material.dart';
import 'package:flutter_prime/view/components/app-bar/custom_appbar.dart';
import 'package:get/get.dart';

import '../../../core/utils/dimensions.dart';
import '../../../core/utils/my_color.dart';
import '../../../core/utils/my_strings.dart';
import '../../../data/controller/faq_controller/faq_controller.dart';
import 'faq_widget.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({Key? key}) : super(key: key);

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {

  @override
  void initState() {
    super.initState();
    final controller = Get.put(FaqController());
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // controller.loadData();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.colorLightGrey,
      appBar: CustomAppBar(isShowBackBtn: true, title: MyStrings.faq.tr, bgColor: MyColor.primaryColor),
      body: GetBuilder<FaqController>(
        builder: (controller) =>
        SingleChildScrollView(
          padding: Dimensions.screenPaddingHV,
          physics: const BouncingScrollPhysics(),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.faqQuestionList.length,
            separatorBuilder: (context, index) => const SizedBox(height: Dimensions.space10),
            itemBuilder: (context, index) => FaqListItem(
                answer: (controller.faqAnswerList[index]).tr,
                question:  (controller.faqQuestionList[index]).tr,
                index: index,
                press: (){
                  controller.changeSelectedIndex(index);
                },
                selectedIndex: controller.selectedIndex
            ),
            ),
          ),
        )
    );
  }
}
