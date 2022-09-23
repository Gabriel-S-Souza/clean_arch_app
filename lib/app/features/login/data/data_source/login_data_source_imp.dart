import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class LoginDataSourceImp implements LoginDataSource {
  final HttpClient httpClient;
  LoginDataSourceImp({
    required this.httpClient,
  });
  
  @override
  Future<UserEntity> login(LoginEntity loginEntity) async {
    try {
      final Map<String, dynamic> loginBody = LoginModel.fromEntity(loginEntity).toJson();
      final ResponseModel response = await httpClient.post(apiEndpointLogin, body: loginBody);
      final responseEntity = UserModel.fromJson(response.body!).toEntity();
      return responseEntity;
    } 
    catch (e) {
      rethrow;
    }
  }
}