import 'package:dartz/dartz.dart';
import 'package:drb_shipment_user/core/constants.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/packages_model.dart';
import '../repository/packages_repository.dart';

class GetPackagesUsecase {
  final _repository = sl<PackagesRepository>();

  Future<Either<Failure, List<PackagesModel>>> call(
    String uId, {
    String? status,
  }) async => await _repository.getPackages(uId, status: status);
}
