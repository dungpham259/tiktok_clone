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

import '../../data/repositories/user/remote/user_reposiory.dart' as _i11;
import '../../data/repositories/user/remote/user_repository_impl.dart' as _i12;
import '../../features/app/cubit/app_cubit.dart' as _i3;
import '../../features/home/cubit/home_cubit.dart' as _i8;
import '../../services/crashlytics_service/crashlytics_service.dart' as _i4;
import '../../services/crashlytics_service/firebase_crashlytics_service.dart'
    as _i5;
import '../../services/log_service/debug_log_service.dart' as _i10;
import '../../services/log_service/log_service.dart' as _i9;
import 'dio_client_di.dart' as _i13;
import 'secure_storage_di.dart' as _i14;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt init(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dioInjection = _$DioInjection();
  final secureStorageInjection = _$SecureStorageInjection();
  gh.lazySingleton<_i3.AppCubit>(() => _i3.AppCubit());
  gh.singleton<_i4.CrashlyticsService>(_i5.FirebaseCrashlyticsService());
  gh.singleton<_i6.Dio>(dioInjection.dio());
  gh.factory<_i7.FlutterSecureStorage>(() => secureStorageInjection.storage());
  gh.lazySingleton<_i8.HomeCubit>(() => _i8.HomeCubit());
  gh.singleton<_i9.LogService>(_i10.DebugLogService());
  gh.factory<_i11.UserRepository>(() => _i12.UserRepositoryImpl(gh<_i6.Dio>()));
  return getIt;
}

class _$DioInjection extends _i13.DioInjection {}

class _$SecureStorageInjection extends _i14.SecureStorageInjection {}
