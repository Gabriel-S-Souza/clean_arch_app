import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data/data.dart';
import '../entities/entities.dart';

abstract class LoginRepository {
  Future<Either<ExceptionApp, UserEntity>> login(LoginModel loginModel);
}