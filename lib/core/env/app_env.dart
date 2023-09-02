import 'package:flutter/foundation.dart';
import 'package:tiktok/core/env/app_env_field.dart';
import 'package:tiktok/core/env/dev_env.dart';
import 'package:tiktok/core/env/product_env.dart';

abstract interface class AppEnv implements AppEnvField {
  factory AppEnv() => _instance;

  static const AppEnv _instance = kReleaseMode ? ProductEnv() : DevEnv();
}
