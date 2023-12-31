import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiktok/core/utils/method/aliases.dart';

part 'alert_model.freezed.dart';

enum AlertType {
  constructive,
  destructive,
  error,
  notification,
  exception,
  quiet
}

@freezed
class AlertModel with _$AlertModel {
  const factory AlertModel({
    required String message,
    required AlertType type,
    @Default(false) bool translatable,
    int? code,
  }) = _AlertModel;

  factory AlertModel.alert({
    required String message,
    required AlertType type,
    bool translatable = false,
    int? code,
  }) {
    if (type == AlertType.error) {
      logIt.i(message);
    }

    return AlertModel(
      message: message,
      type: type,
      translatable: translatable,
      code: code,
    );
  }

  // factory AlertModel.exception({
  //   required dynamic exception,
  //   bool isTest = false,
  //   StackTrace? stackTrace,
  // }) {
  //   String message;
  //   var translatable = false;

  //   switch (exception) {
  //     case BadNetworkException:
  //     case NetworkException:
  //       message = t['core.errors.others.no_internet_connection'] as String;
  //       translatable = true;
  //       break;
  //     case InternalServerException:
  //       message = t['core.errors.others.server_failure'] as String;
  //       translatable = true;
  //       break;
  //     case InvalidJsonFormatException:
  //       message = t['core.errors.others.communication_error'] as String;
  //       translatable = true;
  //       break;
  //     case ApiException:
  //       message = (exception as ApiException).errorMessage;
  //       break;
  //     default:
  //       message = exception.toString();
  //       break;
  //   }

  //   if (isTest) {
  //     logIt.w(message, stackTrace);
  //   }

  //   return AlertModel(
  //     message: message,
  //     type: AlertType.exception,
  //     translatable: translatable,
  //   );
  // }

  factory AlertModel.initial() =>
      AlertModel.alert(message: '', type: AlertType.quiet);

  factory AlertModel.quiet() {
    return const AlertModel(
      message: '',
      type: AlertType.quiet,
    );
  }
}
