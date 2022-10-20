import 'package:dartz/dartz.dart';

import '../domain.dart';

abstract class LoginRepository {
  Future<Either<ExceptionApp, UserEntity>> login(LoginEntity loginEntity);
}
