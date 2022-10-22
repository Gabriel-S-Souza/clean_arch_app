import '../../data.dart';

abstract class MemoryDataSource {
  late UserModel currentUser;
  UserModel getCurrentUser();
  void updateCurrentUser(UserModel user);
}
