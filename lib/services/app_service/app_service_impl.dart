import 'package:injectable/injectable.dart';
import 'package:tiktok/configs/app_config.dart';
import 'package:tiktok/core/keys/app_keys.dart';
import 'package:tiktok/services/app_service/app_service.dart';
import 'package:tiktok/services/local_storage_service/local_storage_service.dart';

@LazySingleton(as: AppService)
class AppServiceImpl implements AppService {
  AppServiceImpl(this._localStorageService);
  final LocalStorageService _localStorageService;

  @override
  bool get isDarkMode =>
      _localStorageService.getBool(key: AppKeys.darkModeKey) ?? false;

  @override
  bool get isFirstUse =>
      _localStorageService.getBool(key: AppKeys.isFirstUseKey) ?? true;

  @override
  String get locale =>
      _localStorageService.getString(key: AppKeys.localeKey) ??
      AppConfig.defaultLocale;

  @override
  Future<void> setIsDarkMode({required bool darkMode}) async {
    return _localStorageService.setValue(
      key: AppKeys.darkModeKey,
      value: darkMode,
    );
  }

  @override
  Future<void> setIsFirstUse({required bool isFirstUse}) async {
    return _localStorageService.setValue(
      key: AppKeys.isFirstUseKey,
      value: isFirstUse,
    );
  }

  @override
  Future<void> setLocale({required String locale}) async {
    return _localStorageService.setValue(
      key: AppKeys.localeKey,
      value: locale,
    );
  }
}
