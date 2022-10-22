import '../domain.dart';

abstract class MemoryRepository {
  UserEntity getCurrentUser();
  void updateCurrentUser(UserEntity user);
}
