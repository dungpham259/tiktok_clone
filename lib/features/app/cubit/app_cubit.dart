import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktok/modules/bloc_observer/ui_status.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState()) {}
  FutureOr<void> initialApp() async {
    emit(
      state.copyWith(
        status: UIStatus.loading(),
      ),
    );
    await Future.delayed(Duration(seconds: 1));
    emit(
      state.copyWith(
        status: UIStatus.loadSuccess(),
      ),
    );
  }
}
