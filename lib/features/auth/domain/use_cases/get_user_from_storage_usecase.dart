import '../../../../core/constants.dart';
import '../entities/user_entity.dart';
import '../repos/auth_repository.dart';

class GetUserFromStorageUsecase {
  final _repository = sl<AuthRepository>();

  UserEntity? call() {
    final user = _repository.getUserFromStorage();
    if (user == null) return null;
    return user;
  }
}
