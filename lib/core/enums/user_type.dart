enum UserType {
  user,
  courier,
  admin;

  static UserType fromFirbaseValue(String value) {
    switch (value) {
      case 'user':
        return UserType.user;
      case 'courier':
        return UserType.courier;
      case 'admin':
        return UserType.admin;
      default:
        return UserType.user;
    }
  }

  String get toFirebaseValue {
    switch (this) {
      case UserType.user:
        return 'user';
      case UserType.courier:
        return 'courier';
      case UserType.admin:
        return 'admin';
    }
  }
}
