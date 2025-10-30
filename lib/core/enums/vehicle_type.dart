import '../languages/local_keys.g.dart';

enum VehicleType {
  truck,
  van,
  car,
  motorcycle,
  bus;

  String get title {
    switch (this) {
      case VehicleType.truck:
        return LocaleKeys.truck;
      case VehicleType.van:
        return LocaleKeys.van;
      case VehicleType.car:
        return LocaleKeys.car;
      case VehicleType.motorcycle:
        return LocaleKeys.motorcycle;
      case VehicleType.bus:
        return LocaleKeys.bus;
    }
  }

  static VehicleType fromFirebaseValue(String value) {
    switch (value) {
      case 'truck':
        return VehicleType.truck;
      case 'van':
        return VehicleType.van;
      case 'car':
        return VehicleType.car;
      case 'motorcycle':
        return VehicleType.motorcycle;
      case 'bus':
        return VehicleType.bus;
      default:
        return VehicleType.truck;
    }
  }
}
