import 'package:drb_shipment_user/core/themes/text_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

import '../../../../../core/color_helper.dart';

class OtpField extends StatelessWidget {
  const OtpField({super.key, required this.onSubmit, required this.onChange});
  final Function(String) onSubmit;
  final Function(String) onChange;
  @override
  Widget build(BuildContext context) {
    return OtpPinField(
      keyboardType: TextInputType.number,
      maxLength: 6,
      fieldWidth: 40.w,
      fieldHeight: 50.h,
      otpPinFieldDecoration: OtpPinFieldDecoration.custom,
      otpPinFieldStyle: OtpPinFieldStyle(
        defaultFieldBackgroundColor: ColorHelper.backgroundBlack,
        defaultFieldBorderColor: ColorHelper.grey200,
        textStyle: AppTextTheme.text16W500grey300,
        fieldBorderRadius: 12.r,
        activeFieldBorderColor: ColorHelper.primaryGreen,
      ),
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      onSubmit: (val) {},
      onChange: (val) {},
    );
  }
}
