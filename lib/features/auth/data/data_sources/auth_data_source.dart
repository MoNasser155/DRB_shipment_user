import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/constants.dart';
import '../../../../core/utils/cashe_storage.dart';
import '../../domain/entities/user_entity.dart';
import '../models/login_params.dart';
import '../models/signup_params.dart';

abstract class AuthDataSource {
  Future<User> signUp({required SignupParams params});
  Future<UserEntity> login({required LoginParams params});
  Future<void> addUser({required UserEntity userEntity});
  Future<UserEntity> getUserData({required String userId});
  Future<void> saveUserData({required UserEntity userEntity});
  Future<void> sendPasswordResetEmail({required String email});
  UserEntity? getCurrentUser();
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<User> signUp({required SignupParams params}) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    
    // send email verification
    await credential.user!.sendEmailVerification();

    // save user data to firestore
    final userModel = UserEntity(
      id: credential.user!.uid,
      email: params.email,
      usreName: params.username,
      phone: params.phoneNumber,
      imageUrl: params.imageUrl,
      fcmToken: 'fcmToken',
      name: '${params.firstName} ${params.lastName}',
    );
    
    await addUser(userEntity: userModel);
    return credential.user!;
  }

  @override
  Future<void> addUser({required UserEntity userEntity}) async {
    await _firestore
        .collection(Collections.users)
        .doc(userEntity.id)
        .set(userEntity.toMap());
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    final user =
        await _firestore.collection(Collections.users).doc(userId).get();
    return UserEntity.fromMap(user.data()!);
  }

  @override
  Future<UserEntity> login({required LoginParams params}) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );

    final user = await getUserData(userId: credential.user!.uid);
    await saveUserData(userEntity: user);
    return user;
  }

  @override
  Future<void> saveUserData({required UserEntity userEntity}) async {
    final userData = userEntity.toMap();
    final encodedData = jsonEncode(userData);
    await CacheStorage.write(Constants.userKey, encodedData);
  }

  @override
  Future<void> sendPasswordResetEmail({required String email}) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  UserEntity? getCurrentUser() {
    final userData = CacheStorage.read(Constants.userKey, isDecoded: true);
    if (userData == null) return null;
    return UserEntity.fromMap(userData);
  }
}