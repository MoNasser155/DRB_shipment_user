import 'package:dartz/dartz.dart';
import '../../../../core/constants.dart';
import '../../../../core/error/failures.dart';
import '../../../couriers/data/models/courier_model.dart';
import '../repository/packages_repository.dart';

class GetCourierByIdUsecase {
  final _repository = sl<PackagesRepository>();

  Future<Either<Failure, CourierModel>> call(String courierId) async =>
      await _repository.getCourierById(courierId);
}
