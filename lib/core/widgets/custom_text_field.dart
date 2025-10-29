import 'dart:ui' as ui;
import 'package:drb_shipment_user/core/helpers/redius_helper.dart';
import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../color_helper.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.onChange,
    this.hint,
    this.suffix,
    this.isHidden = false,
    this.prefix,
    this.initial,
    this.maxlines,
    this.minlines,
    this.readonly = false,
    this.fillColor,
    this.controller,
    this.validate,
    this.inputType,
    this.action,
    this.borderRadius,
    this.scrollPhysics,
    this.enabeledBorder,
    this.inputFormatters,
  });
  final Function(String)? onChange;
  final TextInputAction? action;
  final String? hint, initial;
  final bool isHidden, readonly;
  final Widget? suffix, prefix;
  final int? maxlines, minlines;
  final Color? fillColor;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final TextInputType? inputType;
  final BorderRadius? borderRadius;
  final ScrollPhysics? scrollPhysics;
  final Color? enabeledBorder;
  final List<TextInputFormatter>? inputFormatters;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: inputFormatters,
      scrollPhysics: scrollPhysics ?? const NeverScrollableScrollPhysics(),
      textAlignVertical: TextAlignVertical.center,
      selectionHeightStyle: ui.BoxHeightStyle.max,
      textInputAction: action,
      validator: validate,
      controller: controller,
      initialValue: initial,
      style: AppTextTheme.text14W600grey300,
      onChanged: onChange,
      readOnly: readonly,
      maxLines: maxlines,
      minLines: minlines,
      obscureText: isHidden,
      keyboardType: inputType,
      cursorErrorColor: Colors.red,
      cursorColor: ColorHelper.primaryGreen,

      decoration: InputDecoration(
        errorStyle: const TextStyle(color: Colors.red),
        filled: true,
        fillColor: fillColor ?? Colors.transparent,
        border: OutlineInputBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular(RadiusHelper.kRadius8),
          borderSide: BorderSide(color: ColorHelper.grey50),
        ),
        prefixIcon: prefix,
        prefixIconConstraints: const BoxConstraints(minWidth: 40, maxWidth: 40),
        suffixIcon: suffix,
        prefixIconColor: ColorHelper.grey300,
        suffixIconConstraints: const BoxConstraints(
          minWidth: 44,
          maxWidth: 44,
          minHeight: 44,
          maxHeight: 44,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular(RadiusHelper.kRadius8),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: Colors.red,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular(RadiusHelper.kRadius8),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: enabeledBorder ?? ColorHelper.grey400,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              borderRadius ?? BorderRadius.circular(RadiusHelper.kRadius8),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: ColorHelper.primaryGreen,
          ),
        ),
        hintText: hint,
        hintStyle: AppTextTheme.text14W600grey300.copyWith(
          color: ColorHelper.grey500,
        ),
      ),
    );
  }
}
