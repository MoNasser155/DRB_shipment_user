import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../repository/packages_repository.dart';

class GetSenderByIdUsecase {
  final _repository = sl<PackagesRepository>();

  Future<Either<Failure, UserEntity>> call(String uId) async =>
      await _repository.getSenderById(uId);
}
