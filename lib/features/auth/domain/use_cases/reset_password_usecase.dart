import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../repos/auth_repository.dart';

class ResetPasswordUsecase {
  final _authRepository = sl<AuthRepository>();

  Future<Either<Failure, void>> call({required String email}) =>
      _authRepository.sendPasswordResetEmail(email: email);
}
