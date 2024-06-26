import 'package:flutter/material.dart';
import 'package:shopron/config/utils/dimensions.dart';
import 'package:shopron/config/utils/my_strings.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../config/utils/my_color.dart';
import '../../../../config/utils/style.dart';
class CustomSearchField extends StatefulWidget {

  final String? labelText;
  final String? hintText;
  final Function? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final FormFieldValidator? validator;
  final TextInputType? textInputType;
  final bool isEnable;
  final bool isPassword;
  final bool isShowSuffixIcon;
  final bool isIcon;
  final VoidCallback? onSuffixTap;
  final bool isSearch;
  final bool isCountryPicker;
  final TextInputAction inputAction;
  final bool needOutlineBorder;
  final bool readOnly;
  final bool needRequiredSign;
  final int maxLines;
  final bool animatedLabel;
  final Color fillColor;
  final bool isRequired;
  final String? prefixIconSvg;
  final Color? svgIconColor;

  const CustomSearchField({
    Key? key,
    this.labelText,
    this.readOnly = false,
    this.fillColor = MyColor.transparentColor,
    required this.onChanged,
    this.hintText,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.validator,
    this.textInputType,
    this.isEnable = true,
    this.isPassword = false,
    this.isShowSuffixIcon = false,
    this.isIcon = false,
    this.onSuffixTap,
    this.isSearch = false,
    this.isCountryPicker = false,
    this.inputAction = TextInputAction.next,
    this.needOutlineBorder = false,
    this.needRequiredSign = false,
    this.maxLines = 1,
    this.animatedLabel = false,
    this.isRequired = false,
    this.prefixIconSvg,
    this.svgIconColor
  }) : super(key: key);

  @override
  State<CustomSearchField> createState() => _CustomSearchFieldState();
}

class _CustomSearchFieldState extends State<CustomSearchField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      style: regularDefault.copyWith(color: MyColor.colorBlack),
      cursorColor: MyColor.colorBlack,
      controller: widget.controller,
      autofocus: false,
      textInputAction: widget.inputAction,
      enabled: widget.isEnable,
      focusNode: widget.focusNode,
      validator: widget.validator,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 3, left: 15, right: 15, bottom: 3),
        filled: true,
        fillColor: MyColor.colorLightGrey,
        hintText: widget.hintText,
        border: OutlineInputBorder(borderSide: const BorderSide(width:0.5,color: MyColor.textFieldDisableBorderColor), borderRadius: BorderRadius.circular(5)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(width:.5,color: MyColor.getTextFieldEnableBorder()), borderRadius: BorderRadius.circular(5)),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(width:.5,color: MyColor.textFieldDisableBorderColor.withOpacity(.3)), borderRadius: BorderRadius.circular(5)),
        prefixIcon: widget.prefixIconSvg != null ? Container(
            padding: const EdgeInsets.all(14),
            child: SvgPicture.asset(widget.prefixIconSvg!,colorFilter: ColorFilter.mode(widget.svgIconColor??Theme.of(context).iconTheme.color! , BlendMode.srcIn),)) : null,
      ),
      onFieldSubmitted: (text) => widget.nextFocus != null ? FocusScope.of(context).requestFocus(widget.nextFocus) : null,
      onChanged: (text)=> widget.onChanged!(text),
    );
  }
}
