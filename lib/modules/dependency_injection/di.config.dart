// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i4;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i9;
import 'package:shared_preferences/shared_preferences.dart' as _i12;

import '../../data/repositories/user/remote/user_reposiory.dart' as _i13;
import '../../data/repositories/user/remote/user_repository_impl.dart' as _i14;
import '../../features/app/cubit/app_cubit.dart' as _i22;
import '../../features/auth/cubit/auth_cubit.dart' as _i15;
import '../../features/home/cubit/home_cubit.dart' as _i8;
import '../../services/app_service/app_service.dart' as _i20;
import '../../services/app_service/app_service_impl.dart' as _i21;
import '../../services/crashlytics_service/crashlytics_service.dart' as _i16;
import '../../services/crashlytics_service/firebase_crashlytics_service.dart'
    as _i17;
import '../../services/firebase_service/firebase_service.dart' as _i5;
import '../../services/firebase_service/firebase_service_impl.dart' as _i6;
import '../../services/local_storage_service/local_storage_service.dart'
    as _i18;
import '../../services/local_storage_service/shared_preferences_service.dart'
    as _i19;
import '../../services/log_service/debug_log_service.dart' as _i11;
import '../../services/log_service/log_service.dart' as _i10;
import 'dio_client_di.dart' as _i24;
import 'firebase_crashlytics_di.dart' as _i27;
import 'network_info_di.dart' as _i26;
import 'secure_storage_di.dart' as _i25;
import 'sharedPreferences_di.dart' as _i23;

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
  final firebaseCrashLyticsModule = _$FirebaseCrashLyticsModule();
  final secureStorageInjection = _$SecureStorageInjection();
  final networkInfoInjection = _$NetworkInfoInjection();
  final sharedPreferenceModule = _$SharedPreferenceModule();
  gh.singleton<_i3.Dio>(dioInjection.dio());
  gh.singleton<_i4.FirebaseCrashlytics>(firebaseCrashLyticsModule.crashlytics);
  gh.lazySingleton<_i5.FirebaseService>(() => _i6.FirebaseServiceImpl());
  gh.factory<_i7.FlutterSecureStorage>(() => secureStorageInjection.storage());
  gh.lazySingleton<_i8.HomeCubit>(() => _i8.HomeCubit());
  gh.factory<_i9.InternetConnection>(() => networkInfoInjection.networkInfo);
  gh.singleton<_i10.LogService>(_i11.DebugLogService());
  await gh.singletonAsync<_i12.SharedPreferences>(
    () => sharedPreferenceModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i13.UserRepository>(
      () => _i14.UserRepositoryImpl(gh<_i3.Dio>()));
  gh.lazySingleton<_i15.AuthCubit>(
      () => _i15.AuthCubit(gh<_i5.FirebaseService>()));
  gh.lazySingleton<_i16.CrashlyticsService>(
      () => _i17.FirebaseCrashlyticsService(gh<_i4.FirebaseCrashlytics>()));
  gh.lazySingleton<_i18.LocalStorageService>(
      () => _i19.SharedPreferencesService(gh<_i12.SharedPreferences>()));
  gh.lazySingleton<_i20.AppService>(
      () => _i21.AppServiceImpl(gh<_i18.LocalStorageService>()));
  gh.lazySingleton<_i22.AppCubit>(() => _i22.AppCubit(gh<_i20.AppService>()));
  return getIt;
}

class _$SharedPreferenceModule extends _i23.SharedPreferenceModule {}

class _$DioInjection extends _i24.DioInjection {}

class _$SecureStorageInjection extends _i25.SecureStorageInjection {}

class _$NetworkInfoInjection extends _i26.NetworkInfoInjection {}

class _$FirebaseCrashLyticsModule extends _i27.FirebaseCrashLyticsModule {}
