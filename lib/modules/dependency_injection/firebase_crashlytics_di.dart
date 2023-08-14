import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseCrashLyticsModule {
  @singleton
  FirebaseCrashlytics get crashlytics => FirebaseCrashlytics.instance;
}
