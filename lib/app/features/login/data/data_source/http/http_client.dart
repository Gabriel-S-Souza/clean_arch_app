import '../../models/models.dart';

abstract class HttpClient {
  Future<ResponseModel> post(
    String endpoint,
    {Map<String, String> headers,
    required Map<String, dynamic> body
  });
}