import '../domain.dart';

abstract class SaveAuthDataCase {
  Future<void> saveAuthData(AuthEntity authEntity);
}

class SaveAuthDataCaseImp implements SaveAuthDataCase {
  final AuthRepository _repository;

  SaveAuthDataCaseImp({required AuthRepository repository}) : _repository = repository;

  @override
  Future<void> saveAuthData(AuthEntity authEntity) async {
    await _repository.saveAuthData(authEntity);
  }
}
