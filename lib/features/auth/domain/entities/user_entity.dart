import '../../../../core/enums/user_type.dart';

class UserEntity {
  final String? id;
  final String usreName;
  final String email;
  final String phone;
  final String? createdAt;
  final String fcmToken;
  final UserType? role;
  final String imageUrl;
  final String name;

  UserEntity({
    this.id,
    required this.usreName,
    required this.email,
    required this.phone,
    this.createdAt,
    required this.fcmToken,
    this.role,
    required this.imageUrl,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    final userMap = <String, dynamic>{
      'id': id,
      'username': usreName,
      'email': email,
      'phone': phone,
      'created_at': DateTime.now().toUtc().toString(),
      'fcmToken': fcmToken,
      'role': UserType.user.toFirebaseValue,
      'imageUrl': imageUrl,
      'name': name,
    };
    return userMap;
  }

  factory UserEntity.fromMap(Map<String, dynamic> map) => UserEntity(
    id: map['id'],
    usreName: map['username'],
    email: map['email'],
    phone: map['phone'],
    createdAt: map['created_at'],
    fcmToken: map['fcmToken'],
    role: map['role'],
    imageUrl: map['imageUrl'],
    name: map['name'],
  );

  factory UserEntity.initial() => UserEntity(
    id: '',
    usreName: '',
    email: '',
    phone: '',
    createdAt: '',
    fcmToken: '',
    role: UserType.user,
    imageUrl: '',
    name: '',
  );
}
