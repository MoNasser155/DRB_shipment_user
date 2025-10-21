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
  static const TextStyle underlineText12White = TextStyle(
    color: Colors.white,
    decoration: TextDecoration.underline,
    decorationColor: Colors.white,
    decorationThickness: 2,
    height: 1.5,
    fontSize: 14,
    fontWeight: FontWeight.bold,
  );
}
