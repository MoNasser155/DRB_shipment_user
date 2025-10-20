import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  double get height => MediaQuery.sizeOf(this).height;
  double get width => MediaQuery.sizeOf(this).width;
  double get statusbarHeight => MediaQuery.of(this).padding.top;
  double get bottombarHeight => MediaQuery.of(this).padding.bottom;
  double get keyboardHeight => MediaQuery.of(this).viewInsets.bottom;
  ThemeData get theme => Theme.of(this);
  void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();
}

extension ValidatorExtension on String? {
  bool validate() {
    return (this != null || this!.isNotEmpty || this != ' ');
  }
}
