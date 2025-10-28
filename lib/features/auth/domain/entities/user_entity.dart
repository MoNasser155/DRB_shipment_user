class UserEntity {
  final String? uId;
  final String usreName;
  final String email;
  final String phoneNumber;

  UserEntity({
    this.uId,
    required this.usreName,
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    final userMap = <String, dynamic>{
      'uId': uId,
      'usreName': usreName,
      'email': email,
      'phoneNumber': phoneNumber,
    };
    return userMap;
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) => UserEntity(
    uId: map['uId'],
    usreName: map['usreName'],
    email: map['email'],
    phoneNumber: map['phoneNumber'],
  );

  factory UserEntity.initial () => UserEntity(uId: '', usreName: '', email: '', phoneNumber: '');
}
