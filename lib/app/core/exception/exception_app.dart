abstract class ExceptionApp implements Exception {
  String? message;
}

class ServerException implements ExceptionApp {
  @override
  String? message;
  ServerException([this.message = 'Erro na comunicação com o servidor']);
}

class CredentialsException implements ExceptionApp {
  @override
  String? message;
  CredentialsException([this.message = 'Login e/ou senha incorretos']);
}

class ConnectTimeoutException implements ExceptionApp {
  @override
  String? message;
  ConnectTimeoutException(
      [this.message = 'Verifique sua conexão com a internet']);
}

class NotFoundException implements ExceptionApp {
  @override
  String? message;
  NotFoundException([this.message = 'Ops, algo deu errado']);
}
