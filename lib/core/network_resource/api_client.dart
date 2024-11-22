import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:product_list/core/network_resource/api_exceptions.dart';
import 'package:product_list/core/network_resource/custom_interceptor.dart';

import '../../di/injection_container.dart';


enum Method { POST, GET, PUT, DELETE, PATCH }

class ApiClient {
  final Dio dio;

  ApiClient({required this.dio}) {
    dio.interceptors.addAll([
      sl<CustomInterceptor>(),
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: true,
        maxWidth: 90,
      ),
    ]);
  }

  Future<Either<ApiException, Response>> request({
    required String endPoints,
    required Method method,
    Map<String, dynamic>? additionalHeaders,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      Options options = Options(headers: additionalHeaders);

      Response response = await _performRequest(
        url: endPoints,
        method: method,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );

      if (response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300) {
        return Right(response);
      } else {
        return Left(ApiException.fromStatusCode(response.statusCode ?? 0));
      }
    } on DioException catch (e) {
      return Left(ApiException.fromDioError(e));
    } catch (e) {
      return Left(ApiException(e.toString()));
    }
  }

  Future<Response> _performRequest({
    required String url,
    required Method method,
    dynamic data,
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) {
    switch (method) {
      case Method.GET:
        return dio.get(url, queryParameters: queryParameters, options: options);
      case Method.POST:
        return dio.post(url, data: data, options: options);
      case Method.PUT:
        return dio.put(url, data: data, options: options);
      case Method.DELETE:
        return dio.delete(url, data: data, options: options);
      case Method.PATCH:
        return dio.patch(url, data: data, options: options);
    }
  }
}
