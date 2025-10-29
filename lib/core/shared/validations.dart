import 'package:drb_shipment_user/core/languages/local_keys.g.dart';

class Validations {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.thisFieldIsRequired;
    }
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    if (!emailRegex.hasMatch(value)) {
      return LocaleKeys.pleaseEnterAValidEmail;
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.thisFieldIsRequired;
    } else if (value.length < 6) {
      return LocaleKeys.phoneNumberMustBeAtLeast10Digits;
    }
    return null;
  }


  static String? validateEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.thisFieldIsRequired;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.thisFieldIsRequired;
    } else if (value.length < 6) {
      return LocaleKeys.passwordMustBeAtLeast6Characters;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.thisFieldIsRequired;
    } else if (value != password) {
      return LocaleKeys.passwordDoseNotMatch;
    }
    return null;
  }
}
