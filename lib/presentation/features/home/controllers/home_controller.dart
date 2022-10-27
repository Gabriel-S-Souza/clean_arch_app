import '../../../../domain/domain.dart';

class HomeController {
  final HandleSessionUserCase _handleSessionUserCase;
  HomeController({required HandleSessionUserCase handleSessionUserCase})
      : _handleSessionUserCase = handleSessionUserCase;

  late UserEntity sessionUser;

  void getSessionUser() {
    final user = _handleSessionUserCase.getSessionUser();
    if (user == null) return;
    sessionUser == user;
  }
}
