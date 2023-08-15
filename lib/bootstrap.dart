import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:tiktok/features/app/views/app.dart';
import 'package:tiktok/firebase_options.dart';
import 'package:tiktok/modules/bloc_observer/observer.dart';
import 'package:tiktok/modules/dependency_injection/di.dart';
import 'package:tiktok/services/crashlytics_service/crashlytics_service.dart';

Future<void> bootstrap({
  AsyncCallback? flavorConfiguration,
}) async {
  await runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();

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

    runApp(const App());
  }, (error, stack) {
    getIt<CrashlyticsService>().recordException(error, stack);
  });
}
