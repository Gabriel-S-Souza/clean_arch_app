import '../../domain/domain.dart';
import '../data.dart';

class MemoryRepositoryImp implements MemoryRepository {
  final MemoryDataSource _dataSource;

  MemoryRepositoryImp({required MemoryDataSource dataSource}) : _dataSource = dataSource;

  @override
  UserEntity getCurrentUser() => _dataSource.getCurrentUser().toEntity();

  @override
  void updateCurrentUser(UserEntity user) =>
      _dataSource.updateCurrentUser(UserModel.fromEntity(user));
}
