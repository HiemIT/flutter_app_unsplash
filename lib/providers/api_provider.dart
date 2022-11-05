// class ApiProvider cung cấp các phương thức để gọi API
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app_unsplash/providers/log_provider.dart';
import 'package:flutter_app_unsplash/utils/config/config_env.dart';
import 'package:flutter_app_unsplash/utils/constants/error_response.dart';

dynamic _parseAndDecode(String response) {
  return jsonDecode(response);
}

class ApiProvider {
  late Dio _dio;

  static final ApiProvider _instance = ApiProvider._internal();

  LogProvider get logger => const LogProvider('⚡️ ApiProvider');

  factory ApiProvider() {
    // _instance la de khoi tao 1 lan duy nhat nham tranh truong hop khoi tao nhieu lan va bi loi memory leak (thieu giai phong bo nho)
    return _instance;
  }

  ApiProvider._internal() {
    final baseOptions = BaseOptions(baseUrl: ConfigEnv.getDomainAPI());
    _dio = Dio(baseOptions);
    (_dio.transformer as DefaultTransformer).jsonDecodeCallback =
        _parseAndDecode;
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) {
    final response = _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );

    if (response is! ErrorResponse) return response;

    throw response;
  }
}
