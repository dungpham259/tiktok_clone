// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i3;
import 'package:dio/dio.dart' as _i4;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../../data/repositories/user/remote/user_reposiory.dart' as _i13;
import '../../data/repositories/user/remote/user_repository_impl.dart' as _i14;
import '../../features/app/cubit/app_cubit.dart' as _i23;
import '../../features/auth/cubit/auth_cubit.dart' as _i15;
import '../../features/connection_monitor/cubit/connection_monitor_cubit.dart'
    as _i16;
import '../../features/home/cubit/home_cubit.dart' as _i9;
import '../../services/app_service/app_service.dart' as _i21;
import '../../services/app_service/app_service_impl.dart' as _i22;
import '../../services/crashlytics_service/crashlytics_service.dart' as _i17;
import '../../services/crashlytics_service/firebase_crashlytics_service.dart'
    as _i18;
import '../../services/firebase_service/firebase_service.dart' as _i6;
import '../../services/firebase_service/firebase_service_impl.dart' as _i7;
import '../../services/local_storage_service/local_storage_service.dart'
    as _i19;
import '../../services/local_storage_service/shared_preferences_service.dart'
    as _i20;
import '../../services/log_service/debug_log_service.dart' as _i11;
import '../../services/log_service/log_service.dart' as _i10;
import 'dio_client_di.dart' as _i26;
import 'firebase_crashlytics_di.dart' as _i24;
import 'network_info_di.dart' as _i28;
import 'secure_storage_di.dart' as _i27;
import 'sharedPreferences_di.dart' as _i25;

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
  final networkInfoInjection = _$NetworkInfoInjection();
  final dioInjection = _$DioInjection();
  final firebaseCrashLyticsModule = _$FirebaseCrashLyticsModule();
  final secureStorageInjection = _$SecureStorageInjection();
  final sharedPreferenceModule = _$SharedPreferenceModule();
  gh.factory<_i3.Connectivity>(() => networkInfoInjection.networkInfo);
  gh.singleton<_i4.Dio>(dioInjection.dio());
  gh.singleton<_i5.FirebaseCrashlytics>(firebaseCrashLyticsModule.crashlytics);
  gh.lazySingleton<_i6.FirebaseService>(() => _i7.FirebaseServiceImpl());
  gh.factory<_i8.FlutterSecureStorage>(() => secureStorageInjection.storage());
  gh.lazySingleton<_i9.HomeCubit>(() => _i9.HomeCubit());
  gh.singleton<_i10.LogService>(_i11.DebugLogService());
  await gh.singletonAsync<_i12.SharedPreferences>(
    () => sharedPreferenceModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i13.UserRepository>(
      () => _i14.UserRepositoryImpl(gh<_i4.Dio>()));
  gh.lazySingleton<_i15.AuthCubit>(
      () => _i15.AuthCubit(gh<_i6.FirebaseService>()));
  gh.lazySingleton<_i16.ConnectionMonitorCubit>(
      () => _i16.ConnectionMonitorCubit(gh<_i3.Connectivity>()));
  gh.lazySingleton<_i17.CrashlyticsService>(
      () => _i18.FirebaseCrashlyticsService(gh<_i5.FirebaseCrashlytics>()));
  gh.lazySingleton<_i19.LocalStorageService>(
      () => _i20.SharedPreferencesService(gh<_i12.SharedPreferences>()));
  gh.lazySingleton<_i21.AppService>(
      () => _i22.AppServiceImpl(gh<_i19.LocalStorageService>()));
  gh.lazySingleton<_i23.AppCubit>(() => _i23.AppCubit(gh<_i21.AppService>()));
  return getIt;
}

class _$FirebaseCrashLyticsModule extends _i24.FirebaseCrashLyticsModule {}

class _$SharedPreferenceModule extends _i25.SharedPreferenceModule {}

class _$DioInjection extends _i26.DioInjection {}

class _$SecureStorageInjection extends _i27.SecureStorageInjection {}

class _$NetworkInfoInjection extends _i28.NetworkInfoInjection {}
