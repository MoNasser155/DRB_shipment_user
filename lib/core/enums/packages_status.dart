import 'package:drb_shipment_user/core/languages/local_keys.g.dart';
import 'package:flutter/material.dart';

import '../color_helper.dart';

enum PackagesStatus {
  pending,
  inProgress,
  completed;

  String get firebaseValue {
    switch (this) {
      case PackagesStatus.inProgress:
        return 'inProgress';
      case PackagesStatus.completed:
        return 'completed';
      case PackagesStatus.pending:
        return 'pending';
    }
  }

  String get title {
    switch (this) {
      case PackagesStatus.inProgress:
        return LocaleKeys.inProgress;
      case PackagesStatus.completed:
        return LocaleKeys.completed;
      case PackagesStatus.pending:
        return LocaleKeys.pending;
    }
  }

  static PackagesStatus fromFirebaseValue(String title) {
    switch (title) {
      case 'inProgress':
        return PackagesStatus.inProgress;
      case 'completed':
        return PackagesStatus.completed;
      case 'pending':
        return PackagesStatus.pending;
    }
    return PackagesStatus.inProgress;
  }

  Color get color {
    switch (this) {
      case PackagesStatus.inProgress:
        return ColorHelper.yellow;
      case PackagesStatus.completed:
        return ColorHelper.primaryGreen;
      case PackagesStatus.pending:
        return ColorHelper.grey500;
    }
  }
}
