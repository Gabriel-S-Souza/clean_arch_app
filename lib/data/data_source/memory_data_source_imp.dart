import '../data.dart';

class MemoryDataSourceImp implements MemoryDataSource {
  @override
  late UserModel currentUser;

  @override
  UserModel getCurrentUser() => currentUser;

  @override
  void updateCurrentUser(UserModel user) => currentUser = user;
}
