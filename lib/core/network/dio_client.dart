// core/network/dio_client.dart
import 'package:dio/dio.dart';
import 'package:nexus_social/core/constants/app_constants.dart';

class DioClient {
  // THe internal Dio instance(The Engine)
  late final Dio _dio;

  // This runs when we first start the Network Service
  DioClient() {
    _dio = Dio(
      BaseOptions(
        //Base url
        baseUrl: AppConstants.apiBaseUrl,
        // Timeouts
        connectTimeout: const Duration(
          milliseconds: AppConstants.connectTimeout,
        ),
        receiveTimeout: const Duration(
          milliseconds: AppConstants.receiveTimeout,
        ),
        //Standard Headers
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },

        // response Type
        responseType: ResponseType.json,
      ),
    );

    // Interceptors
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ),
    );
  }

  // EXPOSE METHODS

  // GET Request
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE requets
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
