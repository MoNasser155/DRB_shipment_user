class Coordinates {
  final double latitude;
  final double longitude;

  Coordinates(this.latitude, this.longitude);
}

Coordinates stringToLocation(String location) {
  List<String> parts = location.trim().split(',');
  double lat = double.parse(parts[0].trim());
  double long = double.parse(parts[1].trim());
  return Coordinates(lat, long);
}

String locationToString(Coordinates coordinates) {
  return '${coordinates.latitude}, ${coordinates.longitude}';
}
