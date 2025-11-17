import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/core/constants.dart';
import 'package:drb_shipment_user/features/auth/data/data_sources/auth_data_source.dart';
import 'package:drb_shipment_user/features/auth/data/models/login_params.dart';
import 'package:drb_shipment_user/features/auth/data/models/signup_params.dart';
import 'package:drb_shipment_user/features/auth/domain/entities/user_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/firebase_failuer.dart';
import '../../domain/repos/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _authDataSource = sl<AuthDataSource>();

  @override
  Future<Either<Failure, UserEntity>> login({required LoginParams params}) async {
    try {
      final user = await _authDataSource.login(params: params);
      return Right(user);
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signup({required SignupParams params}) async {
    try {
      final user = await _authDataSource.signUp(params: params);
      return Right(UserEntity(
        id: user.uid,
        usreName: params.username,
        email: params.email,
        phone: params.phoneNumber,
        fcmToken: 'fcmToken',
        imageUrl: params.imageUrl,
        name: '${params.firstName} ${params.lastName}',
      ));
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail({required String email}) async {
    try {
      await _authDataSource.sendPasswordResetEmail(email: email);
      return const Right(null);
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }

  @override
  UserEntity? getUserFromStorage() {
    return _authDataSource.getCurrentUser();
  }
}