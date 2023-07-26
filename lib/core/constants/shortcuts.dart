import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;

  double get getSliverBarHeight => statusBarHeight + kToolbarHeight;

  double get getAppBarHeight => AppBar().preferredSize.height;

  double get getBottomBarHeight => kBottomNavigationBarHeight;

  ColorScheme get getTheme => Theme.of(this).colorScheme;

  ColorScheme get getPrimaryContainer => Theme.of(this).colorScheme;

  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  TextTheme get getTextTheme => Theme.of(this).textTheme;

  Color get getPrimaryColor =>
      ElevationOverlay.colorWithOverlay(getTheme.surface, getTheme.primary, 3);

  Color get getCustomOnPrimaryColor => getTheme.primary.withOpacity(0.5);
/*   return ElevationOverlay.colorWithOverlay(
    getTheme(context).primary,
    getTheme(context).background,
    isDarkMode(context) ? 1000 : 500,
  ); */
}

String colorToHex(Color c) {
  return "#${(c.value.toRadixString(16))..padLeft(8, '0').toUpperCase()}";
}

Color hexToColor(String h) {
  return Color(int.parse(h, radix: 16));
}

LinearGradient colorsToGradient(List<Color> colors, {double opacity = 1}) {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: colors.map((c) => c.withOpacity(opacity)).toList(),
  );
}
