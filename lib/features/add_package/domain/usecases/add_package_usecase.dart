import 'package:dartz/dartz.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failures.dart';
import '../../../packages/data/models/packages_model.dart';
import '../repository/add_package_repository.dart';

class AddPackageUsecase {
  final _repository = sl<AddPackageRepository>();

  Future<Either<Failure, void>> call(PackageModel packagesModel) =>
      _repository.addPackage(packagesModel: packagesModel);
}
