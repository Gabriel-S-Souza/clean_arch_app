import '../data.dart';

class MemoryDataSourceImp implements MemoryDataSource {
  UserModel? _sessionUser;

  @override
  UserModel? getSessionUser() => _sessionUser;

  @override
  void putSessionUser(UserModel user) => _sessionUser = user;
}
