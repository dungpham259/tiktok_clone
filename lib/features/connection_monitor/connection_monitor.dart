// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/core/utils/helper/bar_helper.dart';
import 'package:tiktok/features/app/models/alert_model.dart';
import 'package:tiktok/features/connection_monitor/cubit/connection_monitor_cubit.dart';

class ConnectionMonitor extends StatelessWidget {
  const ConnectionMonitor({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectionMonitorCubit, ConnectionMonitorState>(
      listener: (context, state) {
        state.connectionStatus.when(
          networkAvailable: () =>
              _showConnectionMessage(context, message: 'Back online'),
          networkUnavailable: () => _showConnectionMessage(context,
              message: 'Connect the internet and try again'),
          initial: () {},
        );
      },
      child: child,
    );
  }

  _showConnectionMessage(
    BuildContext context, {
    required String message,
  }) {
    return BarHelper.showAlert(
      context,
      alert: AlertModel(
        message: message,
        type: AlertType.notification,
      ),
    );
  }
}
