import '../../../../core/core.dart';
import '../../domain/entities/entities.dart';
import '../data.dart';

class LoginDataSourceImp implements LoginDataSource {
  final HttpClient httpClient;
  LoginDataSourceImp({
    required this.httpClient,
  });
  
  @override
  Future<UserEntity> login(LoginModel loginData) async {
    try {
      final ResponseModel response = await httpClient.post(apiEndpointLogin, body: loginData.toJson());
      final responseEntity = UserModel.fromJson(response.body!).toEntity();
      return responseEntity;
    } 
    catch (e) {
      rethrow;
    }
  }
}