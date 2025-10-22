extension PhoneMasking on String {
  String get maskedPhone {
    if (length <= 3) return this; // If too short, return as-is
    final visibleDigits = 3; // Last 3 digits visible
    if (length > 15) {
      final maskedPart = substring(0, length - visibleDigits).replaceAll(
        RegExp(r'[\d\W]'),
        'x',
      ); // Masks digits and special characters
      final visiblePart = substring(length - visibleDigits);
      return maskedPart + visiblePart;
    } else {
      final maskedPart = substring(0, length).replaceAll(
        RegExp(r'[\d\W]'),
        'x',
      ); // Masks digits and special characters

      return maskedPart;
    }
  }
}
