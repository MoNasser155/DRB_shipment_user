import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:flutter/material.dart';

abstract class AppTextTheme {
  static const TextStyle text28W700White = TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 28,
    color: Colors.white,
  );
  static const TextStyle text16W500grey300 = TextStyle(
    color: ColorHelper.grey300,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle underlineText14White = TextStyle(
    color: Colors.white,
    decoration: TextDecoration.underline,
    decorationColor: Colors.white,
    decorationThickness: 2,
    height: 1.5,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle nonlineText14White = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle underlineText14Primary = TextStyle(
    color: ColorHelper.primaryGreen,
    decoration: TextDecoration.underline,
    decorationColor: ColorHelper.primaryGreen,
    decorationThickness: 2,
    height: 1.5,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle nonlineText14Primary = TextStyle(
    color: ColorHelper.primaryGreen,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle text14W500grey400 = TextStyle(
    color: ColorHelper.grey400,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle text14W600grey300 = TextStyle(
    color: ColorHelper.grey300,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle text10W500grey300 = TextStyle(
    color: ColorHelper.grey300,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle text20W600grey100 = TextStyle(
    color: ColorHelper.grey100,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle text14W500grey300 = TextStyle(
    color: ColorHelper.grey300,
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static const TextStyle appBarTitle = TextStyle(
    color: ColorHelper.grey100,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle selectedTap = TextStyle(
    color: ColorHelper.primaryGreen,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
  static const TextStyle nonSelectedTap = TextStyle(
    color: ColorHelper.grey100,
    fontSize: 10,
    fontWeight: FontWeight.w500,
  );
}
