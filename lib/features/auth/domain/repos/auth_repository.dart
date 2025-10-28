import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/core/error/failures.dart';
import 'package:drb_shipment_user/features/auth/domain/entities/user_entity.dart';

import '../../data/models/login_params.dart';
import '../../data/models/signup_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signup({required SignupParams params});
  Future<Either<Failure, UserEntity>> login({required LoginParams params});
  Future<UserEntity> getUserFromStorage();
}
