import 'package:dio/dio.dart';

import '../../../../../core/core.dart';
import '../../data.dart';
import 'http_client.dart';

class HttpClientImp implements HttpClient {
  final Dio _dio;
  
  HttpClientImp({
    Dio? dio
  }) : _dio = dio ?? Dio(
      BaseOptions(
        baseUrl: apiDomain + apiBasePath,
        connectTimeout: 10000,
        receiveTimeout: 10000,
      ),
    );

  @override
  Future<ResponseModel> post(
    String endpoint, 
    {Map<String, String> headers = const {'Content-Type': 'application/json'},
    required Map<String, dynamic> body
  }) async {
    try {
      final Response response = await _dio.post(
        endpoint, 
        options: Options(headers: headers),
        data: body
      );
      return ResponseModel(
        statusCode: response.statusCode ?? 0,
        body: response.data
      );

    } catch (e) {
      rethrow;
    }
  }
}
