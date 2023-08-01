part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _AuthInitial;
  const factory AuthState.loading() = _AuthLoading;
  const factory AuthState.authenticated({required UserModel user}) =
      _AuthAuthenticated;
  const factory AuthState.unauthenticated() = _AuthUnauthenticated;
}
