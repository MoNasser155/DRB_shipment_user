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
}
