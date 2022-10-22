import 'package:dio/dio.dart';

import '../../../../../core/core.dart';
import '../../../domain/domain.dart';
import '../../models/models.dart';
import 'http_client.dart';

class HttpClientImp implements HttpClient {
  final Dio _dio;

  HttpClientImp({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: apiDomain + apiBasePath,
                connectTimeout: 10000,
                receiveTimeout: 10000,
                headers: {'Content-Type': 'application/json'},
              ),
            );

  @override
  Future<ResponseModel> post(
    String endpoint, {
    required Map<String, dynamic> body,
  }) async {
    try {
      final Response response = await _dio.post(endpoint, data: body);
      return ResponseModel(statusCode: response.statusCode ?? 0, body: response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  ExceptionApp _handleError(Object e) {
    if (e is DioError) {
      if (e.type == DioErrorType.connectTimeout) {
        return ConnectTimeoutException();
      } else if (e.type == DioErrorType.cancel ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.other ||
          e.type == DioErrorType.response) {
        return ServerException();
      } else if (e.response?.statusCode != null && e.response?.statusCode == 401) {
        return CredentialsException();
      } else {
        return NotFoundException();
      }
    }
    return NotFoundException();
  }
}
