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

enum PaymentStatus {
  pending,
  inProgress,
  completed,
  canceled;

  String get firebaseValue {
    switch (this) {
      case PaymentStatus.pending:
        return 'pending';
      case PaymentStatus.inProgress:
        return 'inProgress';
      case PaymentStatus.completed:
        return 'completed';
      case PaymentStatus.canceled:
        return 'canceled';
    }
  }

  String get title {
    switch (this) {
      case PaymentStatus.pending:
        return LocaleKeys.pending;
      case PaymentStatus.inProgress:
        return LocaleKeys.inProgress;
      case PaymentStatus.completed:
        return LocaleKeys.completed;
      case PaymentStatus.canceled:
        return LocaleKeys.canceled;
    }
  }

  static PaymentStatus fromFirebaseValue(String value) {
    switch (value) {
      case 'pending':
        return PaymentStatus.pending;
      case 'inProgress':
        return PaymentStatus.inProgress;
      case 'completed':
        return PaymentStatus.completed;
      case 'canceled':
        return PaymentStatus.canceled;
      default:
        throw ArgumentError('Invalid payment status: $value');
    }
  }
}
