import '../domain.dart';

abstract class MemoryRepository {
  UserEntity? getCurrentUser();
  void putCurrentUser(UserEntity user);
}
