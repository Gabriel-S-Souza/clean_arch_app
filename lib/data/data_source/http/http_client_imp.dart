import 'dart:developer';

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
            ) {
    _getInterceptors();
  }

  void _getInterceptors() {
    _dio.interceptors.add(_buildInterceptor);
  }

  @override
  Future<ResponseModel> get(String endpoint, {Map<String, String>? headers}) async {
    try {
      final response = await _dio.get(
        endpoint,
        options: Options(headers: headers),
      );
      return ResponseModel(
        statusCode: response.statusCode ?? 0,
        body: response.data,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<ResponseModel> post(
    String endpoint, {
    required Map<String, dynamic> body,
    Map<String, dynamic>? headers,
  }) async {
    try {
      final response = await _dio.post(endpoint, data: body);
      return ResponseModel(
        statusCode: response.statusCode ?? 0,
        body: response.data,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  @override
  Future<ResponseModel> put(
    String endpoint, {
    Map<String, String>? headers,
    required Map<String, dynamic> body,
  }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: body,
        options: Options(headers: headers),
      );
      return ResponseModel(
        statusCode: response.statusCode ?? 0,
        body: response.data,
      );
    } catch (e) {
      throw _handleError(e);
    }
  }

  ExceptionApp _handleError(Object e) {
    if (e is DioError) {
      if (e.type == DioErrorType.connectTimeout) {
        return ConnectTimeoutException(statusCode: e.response?.statusCode);
      } else if (e.type == DioErrorType.cancel ||
          e.type == DioErrorType.receiveTimeout ||
          e.type == DioErrorType.other ||
          e.type == DioErrorType.response) {
        return ServerException(statusCode: e.response?.statusCode);
      } else if (e.response?.statusCode != null && e.response?.statusCode == 401) {
        return CredentialsException(statusCode: e.response?.statusCode);
      } else {
        return NotFoundException(statusCode: e.response?.statusCode);
      }
    }
    return NotFoundException();
  }

  LogInterceptor get _buildInterceptor => LogInterceptor(
      request: true,
      error: true,
      requestBody: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: true,
      logPrint: (object) {
        log(object.toString(), name: 'dio', level: 0);
      });
}
