import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../packages/data/models/packages_model.dart';
import '../../data/models/governments_model.dart';

abstract class AddPackageRepository {
  Future<Either<Failure, void>> addPackage({
    required PackageModel packagesModel,
  });
  Future<BaseGovernmentsModel> getGovernments();
}
