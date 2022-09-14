import '../../domain/domain.dart';

abstract class LoginDataSource {
  Future<UserEntity?> login();
}