import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/core/constants.dart';
import 'package:drb_shipment_user/core/error/failures.dart';
import 'package:drb_shipment_user/core/utils/cashe_storage.dart';
import 'package:drb_shipment_user/features/auth/data/data_sources/auth_data_source.dart';
import 'package:drb_shipment_user/features/auth/data/models/login_params.dart';
import 'package:drb_shipment_user/features/auth/data/models/signup_params.dart';
import 'package:drb_shipment_user/features/auth/domain/entities/user_entity.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/languages/local_keys.g.dart';
import '../../domain/repos/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final _authDataSource = sl<AuthDataSource>();
  @override
  Future<Either<Failure, UserEntity>> login({
    required LoginParams params,
  }) async {
    try {
      var user = await _authDataSource.login(params: params);
      final userEntity = UserEntity(
        uId: user.uid,
        usreName: user.displayName ?? '',
        email: user.email ?? '',
        phoneNumber: user.phoneNumber ?? '',
      );
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(LocaleKeys.anErrorHasOccurred));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signup({
    required SignupParams params,
  }) async {
    try {
      var user = await _authDataSource.signup(params: params);
      final userEntity = UserEntity(
        uId: user.uid,
        usreName: params.username,
        email: params.email,
        phoneNumber: params.phoneNumber,
      );
      await _authDataSource.addUser(user: userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure(LocaleKeys.anErrorHasOccurred));
    }
  }

  @override
  Future<UserEntity> getUserFromStorage() async {
    return await CacheStorage.read(Constants.userKey);
  }
}
