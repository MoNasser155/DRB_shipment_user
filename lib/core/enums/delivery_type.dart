import '../languages/local_keys.g.dart';

enum DeliveryType {
  regular,
  express;

  String get firebaseValue {
    switch (this) {
      case DeliveryType.regular:
        return 'regular';
      case DeliveryType.express:
        return 'express';
    }
  }

  String get name {
    switch (this) {
      case DeliveryType.regular:
        return LocaleKeys.regularDelivery;
      case DeliveryType.express:
        return LocaleKeys.expressDelivery;
    }
  }

  static DeliveryType fromFirebaseValue(String value) {
    switch (value) {
      case 'regular':
        return DeliveryType.regular;
      case 'express':
        return DeliveryType.express;
      default:
        return DeliveryType.regular;
    }
  }
}
