import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok/core/utils/method/aliases.dart';
import 'package:tiktok/services/local_storage_service/local_storage_service.dart';

@LazySingleton(as: LocalStorageService)
class SharedPreferencesService implements LocalStorageService {
  SharedPreferencesService(this._pref);
  final SharedPreferences _pref;

  @override
  FutureOr<void> init() async {
    // _pref = getIt<SharedPreferences>();
  }

  @override
  Object? getValue({
    required String key,
  }) {
    return _pref.get(key);
  }

  @override
  FutureOr<void> setValue({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      await _pref.setString(key, value);
    } else if (value is int) {
      await _pref.setInt(key, value);
    } else if (value is double) {
      await _pref.setDouble(key, value);
    } else if (value is bool) {
      await _pref.setBool(key, value);
    } else if (value is List<String>) {
      await _pref.setStringList(key, value);
    } else {
      await _pref.setString(key, value.toString());
      logIt.w(
        'SharedPreferences did not support this type,'
        ' will save to String by toString() function',
      );
    }
  }

  @override
  bool? getBool({required String key}) {
    return _pref.getBool(key);
  }

  @override
  double? getDouble({required String key}) {
    return _pref.getDouble(key);
  }

  @override
  int? getInt({required String key}) {
    return _pref.getInt(key);
  }

  @override
  String? getString({required String key}) {
    return _pref.getString(key);
  }

  @override
  List<String>? getStringList({required String key}) {
    return _pref.getStringList(key);
  }

  @override
  FutureOr<bool> removeEntry({
    required String key,
  }) async {
    final bool result = await _pref.remove(key);
    return result;
  }
}
