import 'package:dartz/dartz.dart';
import '../../../../core/constants.dart';
import '../../../../core/errors/failures.dart';
import '../../../packages/data/models/packages_model.dart';
import '../repos/home_repository.dart';

class GetHomePackages {
  final _repository = sl<HomeRepository>();

  Future<Either<Failure, List<PackageModel>>> call(String uId) =>
      _repository.getHomePackages(uId);
}
