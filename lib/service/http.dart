import 'package:dio/dio.dart';

class HttpService {
  static final HttpService _instance = HttpService._internal();
  factory HttpService() {
    return _instance;
  }
  HttpService._internal();
  final Dio _dio = Dio();
  void init() {
    _dio.options = BaseOptions(
      baseUrl: 'https://dev.bluewaterservice.cn/cloudapi',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        'Content-Type': 'application/json',
      },
      responseType: ResponseType.json,
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          return handler.next(e);
        },
      )
    );
  }

  Future<T> get<T>(String path, { Map<String, dynamic>? queryParameters, Options? options }) async {
    try {
      final response = await _dio.get(path, queryParameters: queryParameters, options: options);
      return response.data as T;
    } catch (e) {
      rethrow;
    }
  }
}