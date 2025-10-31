import '../languages/local_keys.g.dart';

enum Payment {
  cash,
  visa;

  String get firebaseValue {
    switch (this) {
      case Payment.cash:
        return 'cash';
      case Payment.visa:
        return 'visa';
    }
  }

  String get title {
    switch (this) {
      case Payment.cash:
        return LocaleKeys.cash;
      case Payment.visa:
        return LocaleKeys.visa;
    }
  }

  static Payment fromFirebaseValue(String value) {
    switch (value) {
      case 'cash':
        return Payment.cash;
      case 'visa':
        return Payment.visa;
      default:
        throw ArgumentError('Invalid payment method: $value');
    }
  }
}
