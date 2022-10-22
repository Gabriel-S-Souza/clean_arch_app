import '../../domain/domain.dart';
import '../data.dart';

class MemoryRepositoryImp implements MemoryRepository {
  final MemoryDataSource _dataSource;

  MemoryRepositoryImp({required MemoryDataSource dataSource}) : _dataSource = dataSource;

  @override
  UserEntity? getCurrentUser() => _dataSource.getCurrentUser()?.toEntity();

  @override
  void putCurrentUser(UserEntity user) =>
      _dataSource.putCurrentUser(UserModel.fromEntity(user));
}
