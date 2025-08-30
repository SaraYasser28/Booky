import 'dart:developer';

import 'package:dio/dio.dart';
import '../error/error_model.dart';
import 'api_consumer.dart';

class DioApi extends ApiConsumer {
  late final Dio _dio;
  void onCatchDioException(DioException e) {
    switch (e) {
      case DioException.sendTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(
            jsonData: e.response!.data as Map<String, dynamic>,
          ),
        );
      // break;
      case DioException.badResponse:
        throw ServerException(
          errorModel: ErrorModel.fromJson(
            jsonData: e.response!.data as Map<String, dynamic>,
          ),
        );
      case DioException.badCertificate:
        throw ServerException(
          errorModel: ErrorModel.fromJson(
            jsonData: e.response!.data as Map<String, dynamic>,
          ),
        );
      case DioException.connectionError:
        throw ServerException(
          errorModel: ErrorModel.fromJson(
            jsonData: e.response!.data as Map<String, dynamic>,
          ),
        );
      case DioException.connectionTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(
            jsonData: e.response!.data as Map<String, dynamic>,
          ),
        );
      case DioException.receiveTimeout:
        throw ServerException(
          errorModel: ErrorModel.fromJson(
            jsonData: e.response!.data as Map<String, dynamic>,
          ),
        );
    }
  }

  @override
  delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      onCatchDioException(e);
    }
  }

  @override
  Future<List<dynamic>> get(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      log("=====================");
      log(response.data.runtimeType.toString());
      return response.data;
    } on DioException catch (e) {
      onCatchDioException(e);
      return [];
    }
  }

  @override
  post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      onCatchDioException(e);
    }
  }

  @override
  patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      onCatchDioException(e);
    }
  }

  @override
  put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } on DioException catch (e) {
      onCatchDioException(e);
    }
  }
}
