import 'package:drb_shipment_user/core/languages/local_keys.g.dart';
import 'package:flutter/material.dart';

import '../color_helper.dart';

enum PackagesStatus {
  inProgress,
  completed,
  canceled;

  String get firebaseValue {
    switch (this) {
      case PackagesStatus.inProgress:
        return 'inProgress';
      case PackagesStatus.completed:
        return 'completed';
      case PackagesStatus.canceled:
        return 'canceled';
    }
  }

  String get title {
    switch (this) {
      case PackagesStatus.inProgress:
        return LocaleKeys.inProgress;
      case PackagesStatus.completed:
        return LocaleKeys.completed;
      case PackagesStatus.canceled:
        return LocaleKeys.canceled;
    }
  }

  static String setPackageStatusTitle(String title) {
    switch (title) {
      case 'inProgress':
        return PackagesStatus.inProgress.title;
      case 'completed':
        return PackagesStatus.completed.title;
      case 'canceled':
        return PackagesStatus.canceled.title;
    }
    return '';
  }

  Color get color {
    switch (this) {
      case PackagesStatus.inProgress:
        return ColorHelper.yellow;
      case PackagesStatus.completed:
        return ColorHelper.primaryGreen;
      case PackagesStatus.canceled:
        return ColorHelper.red;
    }
  }
}
