import 'package:go_router/go_router.dart';
import 'package:tiktok/features/home/views/home_screen.dart';
import 'package:tiktok/features/profile/view/profile_screen.dart';
import 'package:tiktok/features/settings_privacy/view/setting_privacy_screen.dart';

class AppRouter {
  AppRouter._();

  static const String appDirector = 'appDirector';
  static const String appDirectorPath = '/';

  static const String homeNamed = 'home';
  static const String homePath = '/';

  static const String settingNamed = 'setting';
  static const String settingPath = '/setting';

  static const String assetsNamed = 'assets';
  static const String assetsPath = '/assets';

  static const String dogImageRandomNamed = 'dogImageRandom';
  static const String dogImageRandomPath = '/dogImageRandom';

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
      // GoRoute(
      //   name: assetsNamed,
      //   path: assetsPath,
      //   builder: (context, state) => const AssetsPage(),
      // ),
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
