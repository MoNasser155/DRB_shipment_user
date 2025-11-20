import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../repository/packages_repository.dart';

class GetSenderByIdUsecase {
  final _repository = sl<PackagesRepository>();

  Future<Either<Failure, UserEntity>> call(String senderId) async =>
      await _repository.getSenderById(senderId);
}
