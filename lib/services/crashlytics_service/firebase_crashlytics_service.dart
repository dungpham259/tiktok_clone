import 'package:injectable/injectable.dart';
import 'package:tiktok/services/crashlytics_service/crashlytics_service.dart';

@Singleton(as: CrashlyticsService)
class FirebaseCrashlyticsService implements CrashlyticsService {
  @override
  Future<void> init() {
    // TODO(boilerplate): implement init
    throw UnimplementedError();
  }

  @override
  Future<void> recordException(dynamic exception, StackTrace? stack) {
    // TODO(boilerplate): implement recordException
    throw UnimplementedError();
  }
}
