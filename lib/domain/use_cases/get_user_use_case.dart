import '../domain.dart';

class GetUserUseCase {
  final MemoryRepository _repository;

  GetUserUseCase({required MemoryRepository repository}) : _repository = repository;

  UserEntity? call() => _repository.getCurrentUser();
}
