import '../languages/local_keys.g.dart';

enum Payment {
  cash,
  visa,
  onDelivery;

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
}
