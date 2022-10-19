import '../../../../core/core.dart';
import '../data.dart';

class LoginDataSourceImp implements LoginDataSource {
  final HttpClient httpClient;
  LoginDataSourceImp({
    required this.httpClient,
  });

  @override
  Future<UserModel> login(LoginModel loginModel) async {
    try {
      final Map<String, dynamic> loginBody = loginModel.toJson();
      final response = await httpClient.post(apiEndpointLogin, body: loginBody);
      final UserModel userModel = UserModel.fromJson(response.body!);
      return userModel;
    } catch (e) {
      rethrow;
    }
  }
}
