import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktok/features/app/models/user_model.dart';
import 'package:tiktok/services/firebase_service/firebase_service.dart';

part 'auth_cubit.freezed.dart';
part 'auth_state.dart';

@lazySingleton
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._firebaseService) : super(AuthState.initial());
  final FirebaseService _firebaseService;

  void checkAuthentication() async {
    final user = await _firebaseService.retrieveCurrentUser().first;
    if (user != null) {
      emit(AuthState.authenticated(user: user));
    } else {
      emit(AuthState.unauthenticated());
    }
  }
}
