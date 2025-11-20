import 'package:dartz/dartz.dart';
import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/errors/firebase_failuer.dart';
import '../../../packages/data/models/packages_model.dart';
import '../../domain/repository/add_package_repository.dart';
import '../data_sources/add_package_data_source.dart';
import '../models/governments_model.dart';

class AddPackageRepositoryImpl extends AddPackageRepository {
  final _addPackageDataSource = sl<AddPackageDataSource>();
  @override
  Future<Either<Failure, void>> addPackage({
    required PackageModel packagesModel,
  }) async {
    try {
      final package = await _addPackageDataSource.addPackage(packagesModel);
      return Right(package);
    } catch (e, stack) {
      return Left(FirebaseFailure.from(e, stack));
    }
  }

  @override
  Future<BaseGovernmentsModel> getGovernments() async =>
      await _addPackageDataSource.getGovernments();
}
