// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i6;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../../data/repositories/user/remote/user_reposiory.dart' as _i13;
import '../../data/repositories/user/remote/user_repository_impl.dart' as _i14;
import '../../features/app/cubit/app_cubit.dart' as _i19;
import '../../features/auth/cubit/auth_cubit.dart' as _i3;
import '../../features/home/cubit/home_cubit.dart' as _i8;
import '../../services/app_service/app_service.dart' as _i17;
import '../../services/app_service/app_service_impl.dart' as _i18;
import '../../services/crashlytics_service/crashlytics_service.dart' as _i4;
import '../../services/crashlytics_service/firebase_crashlytics_service.dart'
    as _i5;
import '../../services/local_storage_service/local_storage_service.dart'
    as _i15;
import '../../services/local_storage_service/shared_preferences_service.dart'
    as _i16;
import '../../services/log_service/debug_log_service.dart' as _i11;
import '../../services/log_service/log_service.dart' as _i10;
import 'dio_client_di.dart' as _i21;
import 'network_info_di.dart' as _i23;
import 'secure_storage_di.dart' as _i22;
import 'sharedPreferences_di.dart' as _i20;

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
  gh.lazySingleton<_i3.AuthCubit>(() => _i3.AuthCubit());
  gh.singleton<_i4.CrashlyticsService>(_i5.FirebaseCrashlyticsService());
  gh.singleton<_i6.Dio>(dioInjection.dio());
  gh.factory<_i7.FlutterSecureStorage>(() => secureStorageInjection.storage());
  gh.lazySingleton<_i8.HomeCubit>(() => _i8.HomeCubit());
  gh.factory<_i9.InternetConnection>(() => networkInfoInjection.networkInfo);
  gh.singleton<_i10.LogService>(_i11.DebugLogService());
  await gh.singletonAsync<_i12.SharedPreferences>(
    () => sharedPreferenceModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i13.UserRepository>(
      () => _i14.UserRepositoryImpl(gh<_i6.Dio>()));
  gh.lazySingleton<_i15.LocalStorageService>(
      () => _i16.SharedPreferencesService(gh<_i12.SharedPreferences>()));
  gh.lazySingleton<_i17.AppService>(
      () => _i18.AppServiceImpl(gh<_i15.LocalStorageService>()));
  gh.lazySingleton<_i19.AppCubit>(() => _i19.AppCubit(gh<_i17.AppService>()));
  return getIt;
}

class _$SharedPreferenceModule extends _i20.SharedPreferenceModule {}

class _$DioInjection extends _i21.DioInjection {}

class _$SecureStorageInjection extends _i22.SecureStorageInjection {}

class _$NetworkInfoInjection extends _i23.NetworkInfoInjection {}
