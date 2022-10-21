import '../../models/models.dart';

abstract class HttpClient {
  Future<ResponseModel> post(String endpoint, {required Map<String, dynamic> body});
}
