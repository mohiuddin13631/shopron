import 'package:flutter/material.dart';
import 'package:shopron/config/utils/dimensions.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/config/utils/style.dart';
import 'package:shopron/domain/controller/mens_fashion/mens_fashion_controller.dart';
import 'package:shopron/domain/controller/my_order/my_order_controller.dart';
import 'package:shopron/domain/controller/my_order/my_order_controller.dart';
import 'package:shopron/domain/controller/my_review/my_review_controller.dart';
import 'package:shopron/domain/controller/my_review/my_review_controller.dart';
import 'package:shopron/domain/controller/top_brand/top_brand_controller.dart';
import 'package:shopron/domain/controller/track_order/track_order_controller.dart';
import 'package:shopron/domain/controller/track_order/track_order_controller.dart';
import 'package:shopron/presentation/screens/track_order/widget/connection_line_widget.dart';
import 'package:shopron/presentation/screens/track_order/widget/time_line_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../../config/utils/my_images.dart';
import '../../../config/utils/my_strings.dart';
import '../../../domain/controller/my_cart/my_cart_controller.dart';
import '../../components/app-bar/custom_appbar.dart';
class TrackOrderScreen extends StatefulWidget {
  const TrackOrderScreen({super.key});

  @override
  State<TrackOrderScreen> createState() => _TrackOrderScreenState();
}

class _TrackOrderScreenState extends State<TrackOrderScreen> {

  @override
  void initState() {
    final controller = Get.put(TrackOrderController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return GetBuilder<TrackOrderController>(
        builder: (controller) => const Scaffold(
          appBar: CustomAppBar(
            title: MyStrings.trackOrder,
            leadingImage: MyImages.backButton,
          ),
          body: SingleChildScrollView(
            padding: Dimensions.trackOrderPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TimeLineWidget(
                  isActive: true,title: MyStrings.confirmed,
                  bodyText: MyStrings.confirmedBodyText,
                  svgImage: MyImages.trackOrderConfirmed
                ),
                TimeLineWidget(
                  isActive: false,
                  title: MyStrings.inProcessing,
                  svgImage: MyImages.processing
                ),
                TimeLineWidget(
                  isActive: false,
                  svgImage: MyImages.dispatched,
                  title: MyStrings.dispatched,
                ),
                TimeLineWidget(
                  isActive: false,
                  endTrack: true,
                  svgImage: MyImages.delivery,
                  title: MyStrings.delivered,
                )
              ],
            ),
          ),
        )
    );
  }
}




