import 'dart:developer';

import '../../../../core/core.dart';
import '../data.dart';

class RemoteDataSourceImp implements RemoteDataSource {
  final HttpClient _httpClient;
  RemoteDataSourceImp({
    required HttpClient httpClient,
  }) : _httpClient = httpClient;

  @override
  Future<ResponseModel> login(LoginModel loginModel) async {
    try {
      final Map<String, dynamic> loginBody = loginModel.toJson();
      return await _httpClient.post(apiEndpointLogin, body: loginBody);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ResponseModel> getAccessToken(String refreshToken) async {
    log('getAccessToken!!!!!!!!!!!!!!!!');
    try {
      final body = {'refresh': refreshToken};
      final response = await _httpClient.post(apiEndpointRefresh, body: body);
      log(response.statusCode.toString());
      return ResponseModel(
        statusCode: response.statusCode,
        body: response.body,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> putUser(Map<String, dynamic> userMap, AuthModel authModel) async {
    try {
      final response = await _httpClient.put(
        apiEndpointMe,
        headers: {'Authorization': 'Bearer ${authModel.access}'},
        body: userMap,
      );
      final userModel = UserModel.fromJson(response.body!);
      return userModel;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> getUser(String accessToken) async {
    try {
      final response = await _httpClient.get(
        apiEndpointMe,
        headers: {'Authorization': 'Bearer $accessToken'},
      );
      final userModel = UserModel.fromJson(response.body!);
      return userModel;
    } catch (e) {
      rethrow;
    }
  }
}
