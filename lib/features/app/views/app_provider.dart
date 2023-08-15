import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/features/app/cubit/app_cubit.dart';
import 'package:tiktok/features/connection_monitor/cubit/connection_monitor_cubit.dart';
import 'package:tiktok/modules/dependency_injection/di.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            final appCubit = getIt<AppCubit>();
            appCubit.initialApp();
            return appCubit;
          },
        ),
        BlocProvider(
          create: (context) {
            final connectionMonitorCubit = getIt<ConnectionMonitorCubit>();
            connectionMonitorCubit.initial();
            return connectionMonitorCubit;
          },
        ),
      ],
      child: child,
    );
  }
}
