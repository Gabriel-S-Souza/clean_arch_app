abstract class ExceptionApp {
  String? message;
}

class ServerException implements ExceptionApp {
  @override
  String? message;
  ServerException({
    this.message,
  });
}
