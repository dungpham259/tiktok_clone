import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:tiktok/core/constants/constants.dart';
import 'package:tiktok/core/constants/shortcuts.dart';
import 'package:tiktok/features/app/cubit/app_cubit.dart';
import 'package:tiktok/features/app/views/app_provider.dart';
import 'package:tiktok/features/splash/views/splash_page.dart';
import 'package:tiktok/gen/localization_gen/app_localizations.dart';
import 'package:tiktok/modules/bloc_observer/ui_status.dart';
import 'package:tiktok/router/app_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    FlutterNativeSplash.remove();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppProvider(
      child: BlocSelector<AppCubit, AppState, UIStatus>(
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
    final String locale = context.select(
      (AppCubit value) => value.state.locale,
    );

    // final bool isDarkMode = context.select(
    //   (AppBloc value) => value.state.isDarkMode,
    // );

    return MaterialApp.router(
      title: $constants.strings.appName,
      theme: context.theme,
      locale: Locale(locale),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // darkTheme: AppThemes.darkTheme,
      routerConfig: AppRouter.router,
    );
  }
}
