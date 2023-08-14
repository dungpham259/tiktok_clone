import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktok/services/crashlytics_service/crashlytics_service.dart';

@LazySingleton(as: CrashlyticsService)
class FirebaseCrashlyticsService implements CrashlyticsService {
  FirebaseCrashlyticsService(
    this._firebaseCrashlytics,
  );

  final FirebaseCrashlytics _firebaseCrashlytics;

  @override
  Future<void> init({
    bool allowedTracking = true,
  }) async {
    //enable crashlytic
    _firebaseCrashlytics.setCrashlyticsCollectionEnabled(allowedTracking);

    //init
    FlutterError.onError = (errorDetails) {
      _firebaseCrashlytics.recordFlutterFatalError(errorDetails);
    };
  }

  @override
  Future<void> recordException(dynamic exception, StackTrace? stack) async {
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to _firebaseCrashlytics
    return _firebaseCrashlytics.recordError(exception, stack, fatal: true);
  }
}
