import '../../data.dart';

abstract class MemoryDataSource {
  UserModel? getCurrentUser();
  void putCurrentUser(UserModel user);
}
