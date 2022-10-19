import '../../domain/entities/entities.dart';

abstract class LoginDataSource {
  Future<UserEntity> login(LoginEntity loginEntity);
}
