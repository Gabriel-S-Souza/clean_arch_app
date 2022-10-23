import '../../data.dart';

abstract class LocalDataSource {
  bool get isLogged;
  Future<void> saveAuthData(AuthModel authModel);
  AuthModel? getAuthData();
}
