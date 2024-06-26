import 'package:flutter/material.dart';
import 'package:shopron/config/utils/my_color.dart';
import 'package:shopron/config/utils/style.dart';
import 'package:shopron/domain/controller/auth/auth/registration_controller.dart';
import 'package:shopron/presentation/components/bottom-sheet/bottom_sheet_header_row.dart';
import 'package:shopron/presentation/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:shopron/presentation/components/card/bottom_sheet_card.dart';
import 'package:get/get.dart';

class CountryBottomSheet{

  static void bottomSheet(BuildContext context, RegistrationController controller){
   CustomBottomSheet(child: Column(
     children: [
       const BottomSheetHeaderRow(header: ''),
       const SizedBox(height: 15,),
       ListView.builder(itemCount:controller.countryList.length,
         shrinkWrap: true,
         physics: const NeverScrollableScrollPhysics(),
         itemBuilder: (context,index){
           return GestureDetector(
             onTap: (){
               controller.countryController.text = controller.countryList[index].country??'';
               controller.setCountryNameAndCode(controller.countryList[index].country??'',
               controller.countryList[index].countryCode??'', controller.countryList[index].dialCode??'');

               Navigator.pop(context);

               FocusScopeNode currentFocus = FocusScope.of(context);
               if (!currentFocus.hasPrimaryFocus) {
                 currentFocus.unfocus();
               }

             },
             child: BottomSheetCard(
               child: Text(
                   '+${controller.countryList[index].dialCode}  ${controller.countryList[index].country?.tr??''}',
                   style: regularDefault.copyWith(color: MyColor.getTextColor())
               ),
             ),
           );
         })
     ],
   )).customBottomSheet(context);
  }
}