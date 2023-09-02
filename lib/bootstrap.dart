import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:logger/logger.dart';
import 'package:tiktok/core/env/app_env.dart';
import 'package:tiktok/features/app/views/app.dart';
import 'package:tiktok/firebase_options.dart';
import 'package:tiktok/modules/bloc_observer/observer.dart';
import 'package:tiktok/modules/dependency_injection/di.dart';
import 'package:tiktok/services/crashlytics_service/crashlytics_service.dart';

Future<void> bootstrap({
  AsyncCallback? flavorConfiguration,
}) async {
  await runZonedGuarded(() async {
    WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

    Logger.level = Level.verbose;
    await flavorConfiguration?.call();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await configureDependencies();

    getIt<CrashlyticsService>().init(
      allowedTracking: false,
    );

    Bloc.observer = AppBlocObserver();

    AppEnv appEnv = AppEnv();
    print(appEnv.base_asset_url);

    runApp(const App());
  }, (error, stack) {
    getIt<CrashlyticsService>().recordException(error, stack);
  });
}
