import 'package:dio/dio.dart';

enum ApiMethod { get, post, put, delete }

class ApiHelper {
  ApiHelper._();

  factory ApiHelper() => _instance;
  static final ApiHelper _instance = ApiHelper._();

  static final Dio _dio = Dio()
    ..options.baseUrl = ''
    ..options.connectTimeout = 3000
    ..options.receiveTimeout = 3000
    ..interceptors.add(LogInterceptor());

  static final httpMethod = {
    ApiMethod.get: 'get',
    ApiMethod.post: 'post',
    ApiMethod.put: 'put',
    ApiMethod.delete: 'delete',
  };

  static void setHeader() {}
  static void setBaseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
  }

  static Future<Response> request(
    String path, {
    ApiMethod method = ApiMethod.get,
    Map<String, dynamic>? params,
    data,
  }) async {
    try {
      return _dio.request(path,
          options: Options(
            method: httpMethod[method],
          ),
          queryParameters: params,
          data: data);
    } catch (e) {
      rethrow;
    }
  }
}
