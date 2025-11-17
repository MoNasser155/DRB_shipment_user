import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../packages/data/models/packages_model.dart';

abstract class AddPackageRepository {
  Future<Either<Failure, void>> addPackage({
    required PackageModel packagesModel,
  });
}
