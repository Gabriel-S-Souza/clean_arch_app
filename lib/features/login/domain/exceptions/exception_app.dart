abstract class ExceptionApp implements Exception {
  final String message;

  ExceptionApp(this.message);
}

class ServerException extends ExceptionApp {
  ServerException([String message = 'Erro na comunicação com o servidor'])
      : super(message);
}

class CredentialsException extends ExceptionApp {
  CredentialsException([String message = 'Login e/ou senha inválidos'])
      : super(message);
}

class ConnectTimeoutException extends ExceptionApp {
  ConnectTimeoutException(
      [String message = 'Verifique sua conexão com a internet'])
      : super(message);
}

class NotFoundException extends ExceptionApp {
  NotFoundException([String message = 'Ops, algo deu errado']) : super(message);
}
