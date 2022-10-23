import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class LoginRepository {
  Future<Either<ExceptionApp, ResponseEntity>> login(LoginEntity loginEntity);
  Future<Either<ExceptionApp, UserEntity>> getUser();
  Future<void> saveAuthData(AuthEntity authEntity);
  UserEntity userEntityFromMap(Map<String, dynamic> map);
  Future<void> updateAccessToken();
  UserEntity? getSessionUser();
  void putSessionUser(UserEntity user);
}
