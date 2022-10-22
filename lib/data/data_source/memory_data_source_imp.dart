import '../data.dart';

class MemoryDataSourceImp implements MemoryDataSource {
  UserModel? _currentUser;

  @override
  UserModel? getCurrentUser() => _currentUser;

  @override
  void putCurrentUser(UserModel user) => _currentUser = user;
}
