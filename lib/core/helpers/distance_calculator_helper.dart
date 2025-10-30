import 'dart:math';

import '../shared/models/coordinates.dart';

class DistanceCalculatorHelper {
  static const double earthRadiusKm = 6371.0;
  static double calculateDistance(Coordinates coord1, Coordinates coord2) {
    return _calculateDistance(
      coord1.latitude,
      coord1.longitude,
      coord2.latitude,
      coord2.longitude,
      earthRadiusKm,
    );
  }

  static double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
    double radius,
  ) {
    final dLat = _toRadians(lat2 - lat1);
    final dLon = _toRadians(lon2 - lon1);
    final a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);

    final c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return radius * c;
  }

  static double _toRadians(double degrees) {
    return degrees * pi / 180;
  }

  static double calculateZoom(Coordinates coord1, Coordinates coord2) {
    final distance = calculateDistance(coord1, coord2);
    double zoom;
    if (distance <= 0.5) {
      zoom = 16.0;
    } else if (distance <= 2) {
      zoom = 14.0;
    } else if (distance <= 5) {
      zoom = 13.0;
    } else if (distance <= 10) {
      zoom = 12.0;
    } else if (distance <= 25) {
      zoom = 11.0;
    } else if (distance <= 50) {
      zoom = 10.0;
    } else if (distance <= 100) {
      zoom = 9.0;
    } else if (distance <= 200) {
      zoom = 8.0;
    } else if (distance <= 300) {
      zoom = 7.5;
    } else {
      zoom = 7.0;
    }
    return zoom;
  }
}
