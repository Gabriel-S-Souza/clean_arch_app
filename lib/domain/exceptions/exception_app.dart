abstract class ExceptionApp implements Exception {
  final String message;
  final int? statusCode;

  ExceptionApp({required this.message, required this.statusCode});
}

class ServerException extends ExceptionApp {
  ServerException({
    String message = 'Erro na comunicação com o servidor',
    int? statusCode,
  }) : super(message: message, statusCode: statusCode);
}

class CredentialsException extends ExceptionApp {
  CredentialsException({
    String message = 'Credenciais inválidas',
    int? statusCode,
  }) : super(message: message, statusCode: statusCode);
}

class ConnectTimeoutException extends ExceptionApp {
  ConnectTimeoutException({
    String message = 'Verifique sua comunicação com a internet',
    int? statusCode,
  }) : super(message: message, statusCode: statusCode);
}

class NotFoundException extends ExceptionApp {
  NotFoundException({
    String message = 'Ops, algo deu errado',
    int? statusCode,
  }) : super(message: message, statusCode: statusCode);
}
