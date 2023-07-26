import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioInjection {
  @singleton
  Dio dio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: '',
      ),
    );
    if (!kReleaseMode) {
      dio.interceptors.add(
        LogInterceptor(
          requestBody: true,
          responseBody: true,
          request: false,
        ),
      );
    }
    return dio;
  }
}
