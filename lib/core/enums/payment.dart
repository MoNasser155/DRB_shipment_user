import '../languages/local_keys.g.dart';

enum Payment {
  cash,
  visa,
  onDelivery;

  String get firebaseValue {
    switch (this) {
      case Payment.cash:
        return 'cash';
      case Payment.visa:
        return 'visa';
      case Payment.onDelivery:
        return 'onDelivery';
    }
  }

  String get title {
    switch (this) {
      case Payment.cash:
        return LocaleKeys.cash;
      case Payment.visa:
        return LocaleKeys.visa;
      case Payment.onDelivery:
        return LocaleKeys.onDelivery;
    }
  }
  
   static Payment fromFirebaseValue(String value) {
    switch (value) {
      case 'cash':
        return Payment.cash;
      case 'visa':
        return Payment.visa;
      case 'onDelivery':
        return Payment.onDelivery;
      default:
        throw ArgumentError('Invalid payment method: $value');
    }
  }
}
