import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/features/auth/domain/entities/user_entity.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/login_params.dart';
import '../../data/models/signup_params.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> signup({required SignupParams params});
  Future<Either<Failure, UserEntity>> login({required LoginParams params});
  Future<Either<Failure, void>> sendPasswordResetEmail({required String email});
  UserEntity? getUserFromStorage();
}