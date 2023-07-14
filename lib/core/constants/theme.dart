import 'package:flutter/material.dart';
import 'package:tiktok/core/constants/const.dart';

extension ContextExtensions on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;
  double get screenWidth => MediaQuery.of(this).size.width;

  double get statusBarHeight => MediaQuery.of(this).padding.top;
  double get bottomBarHeight => MediaQuery.of(this).padding.bottom;

  TextTheme get textTheme => theme.textTheme;
  InputDecorationTheme get inputDecorationTheme => theme.inputDecorationTheme;
  ColorScheme get colorScheme => theme.colorScheme;

  Color get primaryColor => theme.colorScheme.primary;
  Color get primaryColorLight => theme.primaryColorLight;
  Color get primaryColorDark => theme.primaryColorDark;

  ThemeData get theme => ThemeData(
        useMaterial3: true,
        // textTheme: GoogleFonts.beVietnamProTextTheme().copyWith(
        //   // Display
        //   displayLarge: const TextStyle(
        //     fontSize: 57,
        //     fontWeight: FontWeight.w400,
        //     color: kTextColor,
        //   ),
        //   displayMedium: const TextStyle(
        //     fontSize: 45,
        //     fontWeight: FontWeight.w400,
        //     color: kTextColor,
        //   ),
        //   displaySmall: const TextStyle(
        //     fontSize: 36,
        //     fontWeight: FontWeight.w400,
        //     color: kTextColor,
        //   ),
        //   // Headline
        //   headlineLarge: const TextStyle(
        //     fontSize: 32,
        //     fontWeight: FontWeight.w400,
        //     color: kTextColor,
        //   ),
        //   headlineMedium: const TextStyle(
        //     fontSize: 28,
        //     fontWeight: FontWeight.w400,
        //     color: kTextColor,
        //   ),
        //   headlineSmall: const TextStyle(
        //     fontSize: 23,
        //     fontWeight: FontWeight.w400,
        //     color: kTextColor,
        //   ),
        //   // Title
        //   titleLarge: const TextStyle(
        //     fontSize: 20,
        //     fontWeight: FontWeight.w400,
        //     color: kTextColor,
        //   ),
        //   titleMedium: const TextStyle(
        //     fontSize: 16,
        //     fontWeight: FontWeight.w500,
        //     color: kTextColor,
        //   ),
        //   titleSmall: const TextStyle(
        //     fontSize: 14,
        //     fontWeight: FontWeight.w500,
        //     color: kTextColor,
        //   ),
        //   // Label
        //   labelLarge: const TextStyle(
        //     fontSize: 14,
        //     fontWeight: FontWeight.w500,
        //     color: kTextColor,
        //   ),
        //   labelMedium: const TextStyle(
        //     fontSize: 12,
        //     fontWeight: FontWeight.w500,
        //     color: kTextColor,
        //   ),
        //   labelSmall: const TextStyle(
        //     fontSize: 12,
        //     fontWeight: FontWeight.w500,
        //     color: kTextColor,
        //   ),
        //   // Body
        //   bodyLarge: const TextStyle(
        //     fontSize: 16,
        //     fontWeight: FontWeight.w400,
        //     color: kTextColor,
        //   ),
        //   bodyMedium: const TextStyle(
        //     fontSize: 15,
        //     fontWeight: FontWeight.w400,
        //     color: kTextColor,
        //   ),
        //   bodySmall: const TextStyle(
        //     fontSize: 12,
        //     fontWeight: FontWeight.w400,
        //     color: kTextColor,
        //   ),
        // ),

        // Components
        // primarySwatch: kDarkBlue.toMaterialColor(),

        tabBarTheme: const TabBarTheme(
          labelColor: kDarkBlue,
          unselectedLabelColor: kDarkMain,
          labelStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
          ),
          indicatorSize: TabBarIndicatorSize.tab,
        ),

        dividerTheme: const DividerThemeData(
          space: 0,
          thickness: 0.7,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          titleSpacing: 0,
          centerTitle: false,
          backgroundColor: Colors.white,
          foregroundColor: kDarkMain,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: kDarkMain,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          elevation: 1,
          type: BottomNavigationBarType.fixed,
        ),
        cardTheme: const CardTheme(
          margin: EdgeInsets.zero,
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(kGutter)),
          ),
        ),
        sliderTheme: SliderThemeData(
          overlayShape: SliderComponentShape.noThumb,
          trackHeight: 2,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 5),
        ),

        // Buttons
        buttonTheme: const ButtonThemeData(
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          buttonColor: kDarkMain,
          textTheme: ButtonTextTheme.normal,
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            foregroundColor: kDarkMain,
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadius),
            ),
            padding: const EdgeInsets.all(kGutter),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: kDarkBlue,
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadius),
            ),
            padding: const EdgeInsets.all(kGutter),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            backgroundColor: Colors.transparent,
            foregroundColor: kDarkBlue,
            side: const BorderSide(color: kDarkBlue),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kRadius),
            ),
            textStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            padding: const EdgeInsets.all(kGutter),
          ),
        ),
        // Inputs
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: kScaffordColor,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(kRadius)),
          enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: kGutter,
            vertical: kGutter,
          ),
        ),
      );
}
