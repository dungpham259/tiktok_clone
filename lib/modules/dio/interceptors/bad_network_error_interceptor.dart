import 'package:dio/dio.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:tiktok/modules/dependency_injection/di.dart';
import 'package:tiktok/modules/dio/dio_exception_handler.dart';

class BadNetworkErrorInterceptor extends Interceptor {
  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response == null &&
        !await getIt<InternetConnection>().hasInternetAccess) {
      return handler.reject(
        BadNetworkException(
          requestOptions: err.requestOptions,
        ),
      );
    }

    return handler.next(err);
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    return handler.next(options);
  }
}
