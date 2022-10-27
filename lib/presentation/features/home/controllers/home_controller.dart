import '../../../../domain/domain.dart';

class HomeController {
  final HandleSessionUserCase _handleSessionUserCase;
  HomeController({required HandleSessionUserCase handleSessionUserCase})
      : _handleSessionUserCase = handleSessionUserCase;

  UserEntity? sessionUser;

  void getSessionUser() {
    final user = _handleSessionUserCase.getSessionUser();
    sessionUser = user;
  }
}
