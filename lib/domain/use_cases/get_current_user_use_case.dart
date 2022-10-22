import '../domain.dart';

class GetCurrentUserUseCase {
  final MemoryRepository _repository;

  GetCurrentUserUseCase({required MemoryRepository repository})
      : _repository = repository;

  UserEntity call() => _repository.getCurrentUser();
}
