import 'package:dio/dio.dart';
import 'package:gradution_project/Core/api/api_consumer.dart';
import 'package:gradution_project/Core/api/api_interceptors.dart';
import 'package:gradution_project/Core/api/endPointes.dart';
import 'package:gradution_project/Core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptor());
    dio.options.headers['Accept'] = 'application/json';
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }

  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.delete(path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handelDioExceptions(e);
    }
  }

  @override
  Future get(String path,
      {Object? data, Map<String, dynamic>? queryParameters}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handelDioExceptions(e);
    }
  }

  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.patch(path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handelDioExceptions(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.post(path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handelDioExceptions(e);
    }
  }

  @override
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFromData = false,
  }) async {
    try {
      final response = await dio.put(path,
          data: isFromData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response.data;
    } on DioException catch (e) {
      handelDioExceptions(e);
    }
  }

  //  Future get(String path,
  //     {Object? data, Map<String, dynamic>? queryParameters}) async {
  //   try {
  //     final token = CacheHelper().getData(key: ApiKey.token);
  //     if (token == null) {
  //       throw Exception("Token is null");
  //     }
  //     final response = await dio.get(
  //       path,
  //       data: data,
  //       queryParameters: queryParameters,
  //       options: Options(
  //         headers: {
  //           'Authorization': 'Bearer $token',
  //         },
  //       ),
  //     );
  //     return response.data;
  //   } on DioException catch (e) {
  //     handelDioException(e);
  //   }
  // }
}
