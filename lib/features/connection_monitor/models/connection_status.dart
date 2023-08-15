import 'package:freezed_annotation/freezed_annotation.dart';

part 'connection_status.freezed.dart';

@freezed
abstract class ConnectionStatus with _$ConnectionStatus {
  const factory ConnectionStatus.initial() = NetworkInitial;
  const factory ConnectionStatus.networkAvailable() = NetworkAvailable;
  const factory ConnectionStatus.networkUnavailable() = NetworkUnavailable;
}
