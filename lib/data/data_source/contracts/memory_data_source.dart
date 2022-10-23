import '../../data.dart';

abstract class MemoryDataSource {
  UserModel? getSessionUser();
  void putSessionUser(UserModel user);
}
