import '../../data.dart';

abstract class LoginDataSource {
  Future<UserModel> login(LoginModel loginModel);
}
