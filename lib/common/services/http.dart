import 'package:dio/dio.dart';

class ApiResponse<T> {
  final int code;
  final String msg;
  final T data;

  ApiResponse({
    required this.code,
    required this.msg,
    required this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) {
    return ApiResponse(
      code: json['code'] ?? -1,
      msg: json['msg'] ?? '',
      data: fromJsonT(json['data']),
    );
  }

  bool get success => code == 0;
}

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
        'tenant-id': 1,
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

  Future<ApiResponse<T>> get<T>(
    String path, {
      Map<String, dynamic>? queryParameters,
      Options? options,
      required T Function(dynamic json) fromJsonT,
    }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options
      );
      final json = response.data as Map<String, dynamic>;
      return ApiResponse<T>.fromJson(json, fromJsonT);
    } catch (e) {
      rethrow;
    }
  }
}