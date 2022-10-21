import 'package:dartz/dartz.dart';

import '../../../features.dart';

class LoginRepositoryImp implements LoginRepository {
  final LoginDataSource _dataSource;

  LoginRepositoryImp({required LoginDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<Either<ExceptionApp, UserEntity>> login(LoginEntity loginEntity) async {
    try {
      final loginModel = LoginModel.fromEntity(loginEntity);
      final response = await _dataSource.login(loginModel);
      return right(response.toEntity());
    } on ExceptionApp catch (e) {
      return left(e);
    }
  }
}
