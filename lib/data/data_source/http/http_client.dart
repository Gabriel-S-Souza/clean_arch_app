import '../../models/models.dart';

abstract class HttpClient {
  Future<ResponseModel> get(
    String endpoint, {
    Map<String, String>? headers,
  });
  Future<ResponseModel> post(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, String> headers,
  });
  Future<ResponseModel> put(
    String endpoint, {
    Map<String, String> headers,
    required Map<String, dynamic> body,
  });
}
