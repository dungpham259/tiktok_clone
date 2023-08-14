abstract class CrashlyticsService {
  Future<void> init({
    bool allowedTracking = false,
  });

  Future<void> recordException(dynamic exception, StackTrace? stack);
}
