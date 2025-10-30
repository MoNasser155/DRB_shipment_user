import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/features/add_package/data/data_sources/add_package_data_source.dart';

import '../../../../core/constants.dart';
import '../../../../core/error/failures.dart';
import '../../../packages/data/models/packages_model.dart';
import '../../domain/repository/add_package_repository.dart';

class AddPackageRepositoryImpl extends AddPackageRepository {
  final addPackageDataSource = sl<AddPackageDataSource>();
  @override
  Future<Either<Failure, void>> addPackage({
    required PackageModel packagesModel,
  }) async {
    try {
      final package = await addPackageDataSource.addPackage(packagesModel);
      return Right(package);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
