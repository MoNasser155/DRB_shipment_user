import 'package:drb_shipment_user/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../themes/text_theme.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel({
    super.key,
    required this.label,
    this.hidden = false,
    this.suffix,
    this.hint,
    this.readOnly = false,
    this.fillColor,
    this.controller,
    this.validate,
    this.inputType,
    this.onChange,
    this.removeInit = false,
    this.action,
    this.maxLines = 1,
  });
  final String? label, hint;
  final bool hidden, readOnly, removeInit;
  final Widget? suffix;
  final Color? fillColor;
  final TextEditingController? controller;
  final String? Function(String?)? validate;
  final TextInputType? inputType;
  final Function(String)? onChange;
  final TextInputAction? action;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Text(label!, style: AppTextTheme.text10W500grey300),
        Gap(6.h),
        CustomTextField(
          action: action,
          onChange: onChange,
          inputType: inputType,
          validate: validate,
          readonly: readOnly,
          initial: removeInit ? null : hint,
          controller: controller,
          hint: hint,
          suffix: suffix,
          isHidden: hidden,
          fillColor: fillColor,
          maxlines: maxLines,
          
        ),
      ],
    );
  }
}
