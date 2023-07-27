import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/core/constants/constants.dart';
import 'package:tiktok/core/theme/app_themes.dart';
import 'package:tiktok/features/app/cubit/app_cubit.dart';
import 'package:tiktok/features/splash/views/splash_page.dart';
import 'package:tiktok/gen/localization_gen/app_localizations.dart';
import 'package:tiktok/modules/bloc_observer/ui_status.dart';
import 'package:tiktok/modules/dependency_injection/di.dart';
import 'package:tiktok/router/app_router.dart';
import 'package:tiktok/theme/app_theme.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late AppCubit _appBloc;
  @override
  void initState() {
    _appBloc = getIt<AppCubit>();
    _appBloc.initialApp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _appBloc,
      child: BlocSelector<AppCubit, AppState, UIStatus>(
        bloc: _appBloc,
        selector: (state) => state.status,
        builder: (context, appStatus) {
          return appStatus.when(
            initial: () => const SplashPage(),
            loading: () => const SplashPage(),
            loadFailed: (_) => const SizedBox(),
            loadSuccess: (_) => const _App(),
          );
        },
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App();

  @override
  Widget build(BuildContext context) {
    // final String locale = context.select(
    //   (AppBloc value) => value.state.locale,
    // );

    // final bool isDarkMode = context.select(
    //   (AppBloc value) => value.state.isDarkMode,
    // );

    return MaterialApp.router(
      title: $constants.strings.appName,
      theme: getTheme(brightness: Brightness.light),
      locale: Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      darkTheme: AppThemes.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}
