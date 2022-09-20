import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../domain/domain.dart';
import '../data.dart';

class LoginRepositoryImp implements LoginRepository  {
  final LoginDataSource _dataSource;
  
  LoginRepositoryImp({required LoginDataSource dataSource}) : _dataSource = dataSource;
  
  @override
  Future<Either<ExceptionApp, UserEntity>> login(LoginModel loginModel) async {
    try {
      final response = await _dataSource.login(loginModel);
      return right(response);
    } catch (e) {
      return left(ServerException(message: 'Erro na comunicação com o servidor'));
    }
  }
}