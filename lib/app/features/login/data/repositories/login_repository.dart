import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/exception/exception_app.dart';
import '../../domain/domain.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImp implements LoginRepository  {
  @override
  Future<Either<UserEntity, ExceptionApp>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
  
}