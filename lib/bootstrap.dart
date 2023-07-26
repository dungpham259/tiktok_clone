import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:tiktok/features/app/views/app.dart';
import 'package:tiktok/modules/bloc_observer/observer.dart';
import 'package:tiktok/modules/dependency_injection/di.dart';

Future<void> bootstrap({
  AsyncCallback? firebaseInitialization,
  AsyncCallback? flavorConfiguration,
}) async {
  //await runZonedGuarded(() async {
  WidgetsFlutterBinding.ensureInitialized();

  await firebaseInitialization?.call();
  Logger.level = Level.verbose;
  await flavorConfiguration?.call();

  configureDependencies();

  await getIt.allReady();

  Bloc.observer = AppBlocObserver();

  runApp(const App());
  // }, (error, stack) {
  //   getIt<CrashlyticsService>().recordException(error, stack);
  // });
}
