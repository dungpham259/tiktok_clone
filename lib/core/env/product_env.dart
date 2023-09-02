import 'package:envied/envied.dart';
import 'package:tiktok/core/env/app_env_field.dart';

import 'app_env.dart';

part 'product_env.g.dart';

@Envied(name: 'Env', path: 'assets/env/.env.prod')
final class ProductEnv implements AppEnv, AppEnvField {
  const ProductEnv();

  @override
  @EnviedField(varName: 'BASE_URL')
  final String base_asset_url = _Env.base_asset_url;

  @override
  @EnviedField(varName: 'BASE_ASSET_URL')
  final String base_url = _Env.base_url;

  @override
  @EnviedField(varName: 'BASE_URL_OPEN_API')
  final String open_api_url = _Env.open_api_url;

  @override
  @EnviedField(varName: 'API_KEY_OPEN_API')
  final String opena_api_key = _Env.opena_api_key;
}
