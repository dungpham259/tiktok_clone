part of 'app_cubit.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    @Default(UIInitial()) UIStatus status,
    @Default(AppConfig.defaultLocale) String locale,
  }) = _AppState;
}
