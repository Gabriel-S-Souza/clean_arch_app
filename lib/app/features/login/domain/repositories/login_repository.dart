import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../entities/entities.dart';

abstract class LoginRepository {
  Future<Either<UserEntity, ExceptionApp>> login();
}