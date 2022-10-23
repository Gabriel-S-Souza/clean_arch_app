import '../../data.dart';

abstract class RemoteDataSource {
  Future<ResponseModel> login(LoginModel loginModel);
  Future<ResponseModel> getAccessToken(String refreshToken);
  Future<UserModel> getUser(String accessToken);
  Future<UserModel> putUser(Map<String, dynamic> userMap, AuthModel authModel);
}
