import '../entities/entities.dart';

abstract class LoginDataSource {
  Future<UserEntity> login(LoginEntity loginEntity);
}