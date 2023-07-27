// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i8;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../../data/repositories/user/remote/user_reposiory.dart' as _i14;
import '../../data/repositories/user/remote/user_repository_impl.dart' as _i15;
import '../../features/app/cubit/app_cubit.dart' as _i18;
import '../../features/home/cubit/home_cubit.dart' as _i7;
import '../../services/app_service/app_service.dart' as _i16;
import '../../services/app_service/app_service_impl.dart' as _i17;
import '../../services/crashlytics_service/crashlytics_service.dart' as _i3;
import '../../services/crashlytics_service/firebase_crashlytics_service.dart'
    as _i4;
import '../../services/local_storage_service/local_storage_service.dart' as _i9;
import '../../services/local_storage_service/shared_preferences_service.dart'
    as _i10;
import '../../services/log_service/debug_log_service.dart' as _i12;
import '../../services/log_service/log_service.dart' as _i11;
import 'dio_client_di.dart' as _i19;
import 'network_info_di.dart' as _i21;
import 'secure_storage_di.dart' as _i20;
import 'sharedPreferences_di.dart' as _i22;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioInjection = _$DioInjection();
  final secureStorageInjection = _$SecureStorageInjection();
  final networkInfoInjection = _$NetworkInfoInjection();
  final sharedPreferenceModule = _$SharedPreferenceModule();
  gh.singleton<_i3.CrashlyticsService>(_i4.FirebaseCrashlyticsService());
  gh.singleton<_i5.Dio>(dioInjection.dio());
  gh.factory<_i6.FlutterSecureStorage>(() => secureStorageInjection.storage());
  gh.lazySingleton<_i7.HomeCubit>(() => _i7.HomeCubit());
  gh.factory<_i8.InternetConnection>(() => networkInfoInjection.networkInfo);
  gh.singleton<_i9.LocalStorageService>(_i10.SharedPreferencesService());
  gh.singleton<_i11.LogService>(_i12.DebugLogService());
  await gh.factoryAsync<_i13.SharedPreferences>(
    () => sharedPreferenceModule.prefs,
    preResolve: true,
  );
  gh.factory<_i14.UserRepository>(() => _i15.UserRepositoryImpl(gh<_i5.Dio>()));
  gh.singleton<_i16.AppService>(
      _i17.AppServiceImpl(localStorageService: gh<_i9.LocalStorageService>()));
  gh.lazySingleton<_i18.AppCubit>(
      () => _i18.AppCubit(appService: gh<_i16.AppService>()));
  return getIt;
}

class _$DioInjection extends _i19.DioInjection {}

class _$SecureStorageInjection extends _i20.SecureStorageInjection {}

class _$NetworkInfoInjection extends _i21.NetworkInfoInjection {}

class _$SharedPreferenceModule extends _i22.SharedPreferenceModule {}
