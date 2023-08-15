import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/core/constants/constants.dart';
import 'package:tiktok/core/constants/shortcuts.dart';
import 'package:tiktok/features/connection_monitor/connection_monitor.dart';
import 'package:tiktok/features/home/cubit/home_cubit.dart';
import 'package:tiktok/l10n/l10n.dart';
import 'package:tiktok/modules/dependency_injection/di.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle bottomBarTextStyle = context.theme.textTheme.titleSmall!
        .copyWith(fontSize: 12, fontWeight: FontWeight.w600);
    return ConnectionMonitor(
      child: BlocProvider(
        create: (context) {
          return getIt<HomeCubit>();
        },
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            final currentIndex = state.currentIndex;
            return Scaffold(
              body: IndexedStack(
                index: currentIndex,
                children: $constants.navigation.bottomNavigationScreens(),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: Builder(
                builder: (context) {
                  final localizations = context.localizations;
                  return BottomNavigationBar(
                    onTap: (value) {
                      context.read<HomeCubit>().changeIndex(value);
                    },
                    type: BottomNavigationBarType.fixed,
                    selectedFontSize: 12,
                    selectedLabelStyle: bottomBarTextStyle,
                    unselectedLabelStyle: bottomBarTextStyle,
                    backgroundColor: currentIndex == 0
                        ? $constants.appColor.kDarkMain
                        : $constants.appColor.kWhite,
                    // backgroundColor: kDarkMain,
                    unselectedItemColor:
                        $constants.appColor.kUnselectedItemColor,
                    selectedItemColor: currentIndex == 0
                        ? $constants.appColor.kWhite
                        : $constants.appColor.kDarkMain,
                    currentIndex: currentIndex,
                    items: $constants.navigation.bottomNavigationBarItems(
                      context,
                      localizations,
                      currentIndex,
                    ),
                  );
                },
              ),
              // Center(
              //   child:
              // ),
            );
          },
        ),
      ),
    );
  }
}
