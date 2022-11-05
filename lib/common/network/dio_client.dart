import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';

class DioClient {
  DioClient(String clientId) {
    _dio = Dio(BaseOptions(
        baseUrl: "https://api.unsplash.com",
        headers: {"Authorization": 'Client-ID $clientId'}));
  }
  DioClient.auth() {
    _dio = Dio(BaseOptions(
      baseUrl: "https://unsplash.com",
    ));
  }
  late Dio _dio;

  void updateAuthorization({String? clientId, String? accessToken}) {
    if (clientId != null) {
      _dio.options.headers = {"Authorization": 'Client-ID $clientId'};
    } else if (accessToken != null) {
      _dio.options.headers = {"Authorization": 'Bearer $accessToken'};
    }
  }

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode != null) {
        final statusCode = response.statusCode;
        if (statusCode! >= 200 && statusCode < 300) {
          return response.data;
        }
        throw UnsplashException.fromCode(statusCode);
      }
      throw UnsplashException(message: response.data.toString());
    } on DioError catch (error) {
      if (error.message.toLowerCase().contains('socket')) {
        throw const UnsplashException(message: "No Internet Connection");
      }
      if (error.response?.statusCode != null) {
        throw UnsplashException.fromCode(error.response!.statusCode!);
      }
      throw UnsplashException(message: error.message);
    } on SocketException {
      throw const UnsplashException(message: "No Internet Connection");
    } on TimeoutException {
      throw const UnsplashException(message: "Server Not Responding");
    } catch (error) {
      throw UnsplashException(message: error.toString());
    }
  }

  // Post:----------------------------------------------------------------------
  Future<dynamic> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode != null) {
        final statusCode = response.statusCode;
        if (statusCode! >= 200 && statusCode < 300) {
          return response.data;
        }
        throw UnsplashException.fromCode(statusCode);
      }
      throw UnsplashException(message: response.data.toString());
    } on DioError catch (error) {
      if (error.message.toLowerCase().contains('socket')) {
        throw const UnsplashException(message: "No Internet Connection");
      }
      if (error.response?.statusCode != null) {
        throw UnsplashException.fromCode(error.response!.statusCode!);
      }
      throw UnsplashException(message: error.message);
    } on SocketException {
      throw const UnsplashException(message: "No Internet Connection");
    } on TimeoutException {
      throw const UnsplashException(message: "Server Not Responding");
    } catch (error) {
      throw UnsplashException(message: error.toString());
    }
  }

  // Put:-----------------------------------------------------------------------
  Future<dynamic> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode != null) {
        final statusCode = response.statusCode;
        if (statusCode! >= 200 && statusCode < 300) {
          return response.data;
        }
        throw UnsplashException.fromCode(statusCode);
      }
      throw UnsplashException(message: response.data.toString());
    } on DioError catch (error) {
      if (error.message.toLowerCase().contains('socket')) {
        throw const UnsplashException(message: "No Internet Connection");
      }
      if (error.response?.statusCode != null) {
        throw UnsplashException.fromCode(error.response!.statusCode!);
      }
      throw UnsplashException(message: error.message);
    } on SocketException {
      throw const UnsplashException(message: "No Internet Connection");
    } on TimeoutException {
      throw const UnsplashException(message: "Server Not Responding");
    } catch (error) {
      throw UnsplashException(message: error.toString());
    }
  }

  // Delete:--------------------------------------------------------------------
  Future<dynamic> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      if (response.statusCode != null) {
        final statusCode = response.statusCode;
        if (statusCode! >= 200 && statusCode < 300) {
          return response.data;
        }
        throw UnsplashException.fromCode(statusCode);
      }
      throw UnsplashException(message: response.data.toString());
    } on DioError catch (error) {
      if (error.message.toLowerCase().contains('socket')) {
        throw const UnsplashException(message: "No Internet Connection");
      }
      if (error.response?.statusCode != null) {
        throw UnsplashException.fromCode(error.response!.statusCode!);
      }
      throw UnsplashException(message: error.message);
    } on SocketException {
      throw const UnsplashException(message: "No Internet Connection");
    } on TimeoutException {
      throw const UnsplashException(message: "Server Not Responding");
    } catch (error) {
      throw UnsplashException(message: error.toString());
    }
  }
}

class UnsplashException implements Exception {
  const UnsplashException({this.code, required this.message});
  final String message;
  final int? code;

  factory UnsplashException.fromCode(int codes) {
    switch (codes) {
      case 400:
        return const UnsplashException(
            code: 400,
            message:
                "The request was unacceptable, often due to missing a required parameter");
      case 401:
        return const UnsplashException(
            code: 401, message: "Invalid Access Token");
      case 403:
        return const UnsplashException(
            code: 403, message: "Missing permissions to perform request");
      case 404:
        return const UnsplashException(
            code: 404, message: "The requested resource doesn't exist");
      case 500:
        return const UnsplashException(
            code: 500, message: "Something went wrong on our end");
      case 503:
        return const UnsplashException(
            code: 503, message: "Something went wrong on our end");
      default:
        return const UnsplashException(message: "Error");
    }
  }

  @override
  String toString() => 'UnsplashException(code: $code ,message: $message)';
}
