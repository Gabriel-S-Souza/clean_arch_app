import 'package:injectable/injectable.dart';

import '../../domain/entities/user_entity.dart';
import 'login_data_source.dart';

@Injectable(as: LoginDataSource)
class LoginDataSourceImp implements LoginDataSource {
  @override
  Future<UserEntity?> login() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
}