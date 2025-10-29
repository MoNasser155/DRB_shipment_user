import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../auth/domain/entities/user_entity.dart';
import '../../data/models/packages_model.dart';

abstract class PackagesRepository {
  Future<Either<Failure, List<PackagesModel>>> getPackages(
    String uId, {
    String? status,
  });

  Future<Either<Failure, UserEntity>> getSenderById(String uId);
}
