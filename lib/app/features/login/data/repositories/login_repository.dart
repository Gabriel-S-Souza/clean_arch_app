import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';

class LoginRepositoryImp implements LoginRepository  {
  final LoginDataSource _dataSource;
  
  LoginRepositoryImp({required LoginDataSource dataSource}) : _dataSource = dataSource;
  
  @override
  Future<Either<ExceptionApp, UserEntity>> login(LoginEntity loginEntity) async {
    try {
      final response = await _dataSource.login(loginEntity);
      return right(response);
    } catch (e) {
      //TODO: implement treatments for different types of errors
      return left(ServerException(message: 'Erro na comunicação com o servidor'));
    }
  }
}