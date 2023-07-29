import 'package:flutter/material.dart';
import 'package:tiktok/features/home/views/widgets/plus_button.dart';
import 'package:tiktok/features/profile/view/profile_screen.dart';
import 'package:tiktok/features/shop/view/pages/shop.dart';
import 'package:tiktok/gen/assets.gen.dart';
import 'package:tiktok/gen/fonts.gen.dart';
import 'package:tiktok/l10n/l10n.dart';

final $constants = Constants();

@immutable
class Constants {
  // Theme configuration
  late final theme = _Theme();
  // Theme configuration
  late final palette = _Palette();

  // Navigation configuration.
  late final navigation = _Navigation();

  // String configuration
  late final strings = _Strings();

  // Color app
  late final appColor = _AppColor();
}

@immutable
class _Strings {
  final String appName = 'TikTok CLone';
}

@immutable
class _AppColor {
  final Color kScaffordColor = Color(0xFFebf0f3);
  final Color kBackgroundColor = Color(0xFFeeeeee);
  final Color kBackgroundColor2 = Color.fromARGB(255, 174, 222, 236);
  final Color kBlueMain = Color(0xFF65D2E9);
  final Color kRedMain = Color(0xFFE6436D);
  final Color kWhite = Color(0xFFFFFFFF);
  final Color kDarkBlue = Color.fromARGB(255, 0, 107, 137);
  final Color kDarkMain = Color(0xFF161722);
  final Color kUnselectedItemColor = const Color(0xFF8A8B8F);
  final Color kTextColor1 = const Color(0xFF86878B);
  final Color kUnSelectTabBar = const Color(0xFFD7D7D9);
}

@immutable
class _Palette {
  final List<Color> themes = [
    const Color(0xFFFF0000),
    const Color(0xFFFF8000),
    const Color(0xFFFCCC1A),
    const Color(0xFF66B032),
    const Color(0xFF00FFFF),
    const Color(0xFF0000FF),
    const Color(0xFF0080FF),
    const Color(0xFFFF00FF),
  ];

  final white = const Color(0xFFFFFFFF);
  final black = const Color(0xFF000000);
  final grey = const Color(0xFF9E9E9E);
  final red = const Color(0xFFFF0000);
  final orange = const Color(0xFFFF8000);
  final yellow = const Color(0xFFFCCC1A);
  final green = const Color(0xFF66B032);
  final cyan = const Color(0xFF00FFFF);
  final blue = const Color(0xFF0000FF);
  final purple = const Color(0xFF0080FF);
  final magenta = const Color(0xFFFF00FF);
}

@immutable
class _Theme {
  final tryToGetColorPaletteFromWallpaper = true;
  final defaultThemeColor = $constants.appColor.kDarkMain;
  final defaultFontFamily = FontFamily.nunito;
  final double defaultElevation = 0;
  final double defaultBorderRadius = 24;
}

@immutable
class _Navigation {
  List<Widget> bottomNavigationScreens() => const [
        ProfileScreen(),
        ShopPage(),
        SizedBox.shrink(),
        ProfileScreen(),
        ProfileScreen(),
      ];

  List<BottomNavigationBarItem> bottomNavigationBarItems(
    BuildContext context,
    AppLocalizations localizations,
    int currentIndex,
  ) =>
      [
        BottomNavigationBarItem(
          icon: Assets.icons.svg.home.svg(),
          label: localizations.homeBottomNavigationBar,
          activeIcon: Assets.icons.svg.homeActive.svg(),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: localizations.shopBottomNavigationBar,
        ),
        BottomNavigationBarItem(
          icon: PlusButton(
            currentIndex: currentIndex,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message_rounded),
          label: localizations.inboxBottomNavigationBar,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: localizations.userBottomNavigationBar,
        ),
      ];
}
