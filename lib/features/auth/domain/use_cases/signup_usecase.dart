import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../data/models/signup_params.dart';
import '../entities/user_entity.dart';
import '../repos/auth_repository.dart';

class SignupUsecase {
  final _authRepo = sl<AuthRepository>();

  Future<Either<Failure, UserEntity>> call(SignupParams params) async {
    return await _authRepo.signup(params: params);
  }
}
