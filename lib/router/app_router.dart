import 'package:go_router/go_router.dart';
import 'package:tiktok/features/home/views/home_screen.dart';
import 'package:tiktok/features/profile/view/profile_screen.dart';
import 'package:tiktok/features/settings_privacy/view/pages/language_setting/app_language_screen.dart';
import 'package:tiktok/features/settings_privacy/view/pages/language_setting/language_setting_screen.dart';
import 'package:tiktok/features/settings_privacy/view/pages/setting_privacy_screen.dart';

class AppRouter {
  AppRouter._();

  static const String appDirector = 'appDirector';
  static const String appDirectorPath = '/';

  static const String homeNamed = 'home';
  static const String homePath = '/';

  static const String settingNamed = 'setting';
  static const String settingPath = '/setting';

  static const String languageNamed = 'language';
  static const String languagePath = '/language';

  static const String appLanguageNamed = 'appLanguage';
  static const String appLanguagePath = '/appLanguage';

  static const String imagesFromDbNamed = 'imagesFromDb';
  static const String imagesFromDbPath = '/imagesFromDb';

  static GoRouter get router => _router;
  static final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: homeNamed,
        path: homePath,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: appDirector,
        path: appDirectorPath,
        builder: (context, state) {
          return const ProfileScreen();
        },
      ),

      GoRoute(
        name: settingNamed,
        path: settingPath,
        builder: (context, state) => const SettingAndPrivacyPage(),
      ),
      GoRoute(
        name: languageNamed,
        path: languagePath,
        builder: (context, state) => const LanguageScreen(),
      ),
      GoRoute(
        name: appLanguageNamed,
        path: appLanguagePath,
        builder: (context, state) => const AppLanguageScreen(),
      ),
      // GoRoute(
      //   name: dogImageRandomNamed,
      //   path: dogImageRandomPath,
      //   builder: (context, state) => const DogImageRandomPage(),
      // ),
      // GoRoute(
      //   name: imagesFromDbNamed,
      //   path: imagesFromDbPath,
      //   builder: (context, state) {
      //     if (!kIsWeb) {
      //       return const ImagesFromDbPage();
      //     }

      //     return ErrorPage(
      //       content: S.current.didnt_supported,
      //     );
      //   },
      // ),
    ],
  );
}
