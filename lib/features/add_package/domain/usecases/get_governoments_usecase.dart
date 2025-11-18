import '../../../../core/constants.dart';
import '../../data/models/governments_model.dart';
import '../repository/add_package_repository.dart';

class GetGovernomentsUsecase {
  final _repository = sl<AddPackageRepository>();
  Future<BaseGovernmentsModel> call() async =>
      await _repository.getGovernments();
}
