import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktok/features/connection_monitor/models/connection_status.dart';

part 'connection_monitor_cubit.freezed.dart';
part 'connection_monitor_state.dart';

@lazySingleton
class ConnectionMonitorCubit extends Cubit<ConnectionMonitorState> {
  ConnectionMonitorCubit(this._connectivity)
      : super(ConnectionMonitorState(
            connectionStatus: ConnectionStatus.initial()));
  final Connectivity _connectivity;

  void initial() {
    _connectivity.onConnectivityChanged.listen(
      (event) {
        if (event == ConnectivityResult.none) {
          emit(
            state.copyWith(
              connectionStatus: ConnectionStatus.networkUnavailable(),
            ),
          );
        } else {
          if (state.connectionStatus == ConnectionStatus.networkUnavailable())
            emit(
              state.copyWith(
                connectionStatus: ConnectionStatus.networkAvailable(),
              ),
            );
        }
      },
    );
  }
}
