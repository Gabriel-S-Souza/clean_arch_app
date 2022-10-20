import 'package:dio/dio.dart';

import '../../../../../core/core.dart';
import '../../../../features.dart';

class HttpClientImp implements HttpClient {
  final Dio _dio;

  HttpClientImp({Dio? dio})
      : _dio = dio ??
            Dio(
              BaseOptions(
                baseUrl: apiDomain + apiBasePath,
                connectTimeout: 10000,
                receiveTimeout: 10000,
              ),
            );

  @override
  Future<ResponseModel> post(String endpoint,
      {Map<String, String> headers = const {'Content-Type': 'application/json'},
      required Map<String, dynamic> body}) async {
    try {
      final Response response =
          await _dio.post(endpoint, options: Options(headers: headers), data: body);
      return ResponseModel(statusCode: response.statusCode ?? 0, body: response.data);
    } catch (e) {
      throw _handleError(e);
    }
  }

  ExceptionApp _handleError(Object e) {
    if (e is DioError) {
      final bool isConnectTimeoutException = e.type == DioErrorType.connectTimeout;

      final bool isServerException = e.type == DioErrorType.cancel ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.other;

      if (isConnectTimeoutException) {
        return ConnectTimeoutException();
      } else if (isServerException) {
        return ServerException();
      } else if (e.response?.statusCode != null && e.response?.statusCode == 401) {
        return CredentialsException();
      } else {
        return NotFoundException(e.message.toString());
      }
    } else {
      return NotFoundException(e.toString());
    }
  }
}
