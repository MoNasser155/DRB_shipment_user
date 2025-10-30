import 'package:drb_shipment_user/core/color_helper.dart';
import 'package:flutter/material.dart';

import '../languages/local_keys.g.dart';

enum CourierStatus {
  available,
  busy;

  String get title {
    switch (this) {
      case CourierStatus.available:
        return LocaleKeys.available;
      case CourierStatus.busy:
        return LocaleKeys.busy;
    }
  }

  static CourierStatus fromString(String status) {
    switch (status) {
      case 'available':
        return CourierStatus.available;
      case 'busy':
        return CourierStatus.busy;
      default:
        return CourierStatus.available;
    }
  }

  Color get color {
    switch (this) {
      case CourierStatus.available:
        return ColorHelper.primaryGreen;
      case CourierStatus.busy:
        return Colors.orange;
    }
  }
}
