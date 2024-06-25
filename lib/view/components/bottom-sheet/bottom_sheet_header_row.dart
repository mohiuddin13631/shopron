import 'package:flutter/material.dart';
import 'package:flutter_prime/core/utils/my_strings.dart';
import 'package:flutter_prime/core/utils/style.dart';
import 'package:get/get.dart';
import 'package:flutter_prime/core/utils/dimensions.dart';
import 'package:flutter_prime/core/utils/my_color.dart';
import 'package:flutter_prime/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:flutter_prime/view/components/text/bottom_sheet_header_text.dart';

class BottomSheetHeaderRow extends StatelessWidget {
  final String header ;
  final double bottomSpace;
  final bool closeText;
  final bool isTopIndicator;
  const BottomSheetHeaderRow({Key? key,this.header = '',this.bottomSpace = Dimensions.space10,this.closeText = true,this.isTopIndicator = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isTopIndicator?
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: 5,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: MyColor.colorGrey.withOpacity(0.2),
            ),
          ),
        ):const SizedBox.shrink(),
        const SizedBox(height: Dimensions.space10,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            Expanded(child: BottomSheetHeaderText(text: header.tr)),
            closeText? GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(MyStrings.close,style: regularDefault),
              ),
            ):
            const BottomSheetCloseButton()
          ],
        ),
        SizedBox(height: bottomSpace),
      ],
    );
  }
}
