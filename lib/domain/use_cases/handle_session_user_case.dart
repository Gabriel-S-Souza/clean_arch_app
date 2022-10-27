import '../domain.dart';

abstract class HandleSessionUserCase {
  UserEntity? getSessionUser();
  void putSessionUser(UserEntity user);
}

class HandleSessionUserCaseImp implements HandleSessionUserCase {
  final AuthRepository _repository;

  HandleSessionUserCaseImp({required AuthRepository repository})
      : _repository = repository;

  @override
  UserEntity? getSessionUser() => _repository.getSessionUser();

  @override
  void putSessionUser(UserEntity user) => _repository.putSessionUser(user);
}
