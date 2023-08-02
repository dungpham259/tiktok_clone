// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i8;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i10;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../../data/repositories/user/remote/user_reposiory.dart' as _i14;
import '../../data/repositories/user/remote/user_repository_impl.dart' as _i15;
import '../../features/app/cubit/app_cubit.dart' as _i21;
import '../../features/auth/cubit/auth_cubit.dart' as _i16;
import '../../features/home/cubit/home_cubit.dart' as _i9;
import '../../services/app_service/app_service.dart' as _i19;
import '../../services/app_service/app_service_impl.dart' as _i20;
import '../../services/crashlytics_service/crashlytics_service.dart' as _i3;
import '../../services/crashlytics_service/firebase_crashlytics_service.dart'
    as _i4;
import '../../services/firebase_service/firebase_service.dart' as _i6;
import '../../services/firebase_service/firebase_service_impl.dart' as _i7;
import '../../services/local_storage_service/local_storage_service.dart'
    as _i17;
import '../../services/local_storage_service/shared_preferences_service.dart'
    as _i18;
import '../../services/log_service/debug_log_service.dart' as _i12;
import '../../services/log_service/log_service.dart' as _i11;
import 'dio_client_di.dart' as _i23;
import 'network_info_di.dart' as _i25;
import 'secure_storage_di.dart' as _i24;
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
  gh.lazySingleton<_i6.FirebaseService>(() => _i7.FirebaseServiceImpl());
  gh.factory<_i8.FlutterSecureStorage>(() => secureStorageInjection.storage());
  gh.lazySingleton<_i9.HomeCubit>(() => _i9.HomeCubit());
  gh.factory<_i10.InternetConnection>(() => networkInfoInjection.networkInfo);
  gh.singleton<_i11.LogService>(_i12.DebugLogService());
  await gh.singletonAsync<_i13.SharedPreferences>(
    () => sharedPreferenceModule.prefs,
    preResolve: true,
  );
  gh.lazySingleton<_i14.UserRepository>(
      () => _i15.UserRepositoryImpl(gh<_i5.Dio>()));
  gh.lazySingleton<_i16.AuthCubit>(
      () => _i16.AuthCubit(gh<_i6.FirebaseService>()));
  gh.lazySingleton<_i17.LocalStorageService>(
      () => _i18.SharedPreferencesService(gh<_i13.SharedPreferences>()));
  gh.lazySingleton<_i19.AppService>(
      () => _i20.AppServiceImpl(gh<_i17.LocalStorageService>()));
  gh.lazySingleton<_i21.AppCubit>(() => _i21.AppCubit(gh<_i19.AppService>()));
  return getIt;
}

class _$SharedPreferenceModule extends _i22.SharedPreferenceModule {}

class _$DioInjection extends _i23.DioInjection {}

class _$SecureStorageInjection extends _i24.SecureStorageInjection {}

class _$NetworkInfoInjection extends _i25.NetworkInfoInjection {}
