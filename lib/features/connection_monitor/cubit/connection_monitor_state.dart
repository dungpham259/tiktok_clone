part of 'connection_monitor_cubit.dart';

@freezed
class ConnectionMonitorState with _$ConnectionMonitorState {
  const factory ConnectionMonitorState(
          {@Default(NetworkInitial()) ConnectionStatus connectionStatus}) =
      _ConnectionMonitorState;
}
