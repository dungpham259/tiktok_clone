import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/core/constants/constants.dart';
import 'package:tiktok/features/home/cubit/home_cubit.dart';
import 'package:tiktok/features/home/views/widgets/plus_button.dart';
import 'package:tiktok/modules/dependency_injection/di.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
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
            floatingActionButton: Padding(
              padding: const EdgeInsets.only(top: 47),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: PlusButton(
                  currentIndex: currentIndex,
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomNavigationBar(
              onTap: (value) {
                context.read<HomeCubit>().changeIndex(value);
              },
              type: BottomNavigationBarType.fixed,
              selectedFontSize: 12,
              backgroundColor: currentIndex == 0 ? Colors.black : Colors.white,
              // backgroundColor: kDarkMain,
              unselectedItemColor: const Color(0xFF8A8B8F),
              selectedItemColor:
                  currentIndex == 0 ? Colors.white : Colors.black,
              currentIndex: currentIndex,
              items: $constants.navigation.bottomNavigationBarItems(context),
            ),
            // Center(
            //   child:
            // ),
          );
        },
      ),
    );
  }
}
