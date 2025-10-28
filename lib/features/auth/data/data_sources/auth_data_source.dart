import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drb_shipment_user/core/constants.dart';
import 'package:drb_shipment_user/core/error/exceptions.dart';
import 'package:drb_shipment_user/core/languages/local_keys.g.dart';
import 'package:drb_shipment_user/features/auth/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/utils/cashe_storage.dart';
import '../models/login_params.dart';
import '../models/signup_params.dart';

abstract class AuthDataSource {
  Future<User> signup({required SignupParams params});
  Future<User> login({required LoginParams params});
  Future<void> addUser({required UserEntity user});
  Future<UserEntity> getUserData({required String uId});
  Future<void> saveUserData({required UserEntity user});
}

class AuthDataSourceImpl implements AuthDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<User> signup({required SignupParams params}) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: params.email,
            password: params.password,
          );
      saveUserData(
        user: UserEntity(
          uId: credential.user!.uid,
          usreName: params.username,
          email: params.email,
          phoneNumber: params.phoneNumber,
        ),
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: LocaleKeys.thePasswordProvidedIsTooWeak);
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
          message: LocaleKeys.theEmailAddressIsAlreadyInUseByAnotherAccount,
        );
      } else {
        throw CustomException(
          message:
              "${LocaleKeys.anErrorHasOccurred}, ${LocaleKeys.pleaseTryAgainLater}",
        );
      }
    } catch (e) {
      throw CustomException(
        message:
            "${LocaleKeys.anErrorHasOccurred}, ${LocaleKeys.pleaseTryAgainLater}",
      );
    }
  }

  @override
  Future<void> addUser({required UserEntity user}) async {
    try {
      await _firestore.collection('users').doc(user.uId).set({
        'uId': user.uId,
        'usreName': user.usreName,
        'email': user.email,
        'phoneNumber': user.phoneNumber,
      });
    } catch (e) {
      throw CustomException(
        message:
            "${LocaleKeys.anErrorHasOccurred}, ${LocaleKeys.pleaseTryAgainLater}",
      );
    }
  }

  @override
  Future<User> login({required LoginParams params}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: params.email,
        password: params.password,
      );
      final user = await getUserData(uId: credential.user!.uid);
      saveUserData(user: user);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw CustomException(message: LocaleKeys.noUserFoundForThatEmail);
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: LocaleKeys.wrongPassword);
      } else {
        throw CustomException(
          message:
              "${LocaleKeys.anErrorHasOccurred}, ${LocaleKeys.pleaseTryAgainLater}",
        );
      }
    }
  }

  @override
  Future<UserEntity> getUserData({required String uId}) async {
    try {
      final user = await _firestore.collection('users').doc(uId).get();
      return UserEntity.fromMap(user.data()!);
    } catch (e) {
      throw CustomException(
        message:
            "${LocaleKeys.anErrorHasOccurred}, ${LocaleKeys.pleaseTryAgainLater}",
      );
    }
  }

  @override
  Future<void> saveUserData({required UserEntity user}) async {
    final userJson = user.toMap();
    final encodedData = jsonEncode(userJson);
    await CacheStorage.write(Constants.userKey, encodedData);
  }
}
