import '../../domain/domain.dart';
import '../data.dart';

abstract class LoginDataSource {
  Future<UserEntity> login(LoginModel loginData);
}