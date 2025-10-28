import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failures.dart';
import '../../data/models/login_params.dart';
import '../entities/user_entity.dart';
import '../repos/auth_repository.dart';

class LoginUsecase {
  final _repository = sl<AuthRepository>();

  Future<Either<Failure, UserEntity>> call({
    required LoginParams params,
  }) async {
    return _repository.login(params: params);
  }
}
