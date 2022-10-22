import '../../../domain/domain.dart';

abstract class MemoryDataSource {
  late UserEntity currentUser;
  UserEntity getCurrentUser();
  void updateCurrentUser(UserEntity user);
}
