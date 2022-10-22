import '../../../domain/domain.dart';
import '../data.dart';

// class MemoryDataSourceImp {
//   late UserEntity _currentUser;
//   UserEntity getCurrentUser() => _currentUser;
//   void defineCurrentUser(UserEntity user) => _currentUser = user;
// }

class MemoryDataSourceImp implements MemoryDataSource {
  @override
  late UserEntity currentUser;

  @override
  UserEntity getCurrentUser() => currentUser;

  @override
  void updateCurrentUser(UserEntity user) => currentUser = user;
}
