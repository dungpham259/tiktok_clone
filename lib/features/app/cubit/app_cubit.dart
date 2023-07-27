import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:tiktok/configs/app_config.dart';
import 'package:tiktok/modules/bloc_observer/ui_status.dart';
import 'package:tiktok/services/app_service/app_service.dart';

part 'app_cubit.freezed.dart';
part 'app_state.dart';

@lazySingleton
class AppCubit extends Cubit<AppState> {
  AppCubit({
    required AppService appService,
  }) : super(AppState()) {
    _appService = appService;
  }

  late final AppService _appService;

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

  FutureOr<void> onLocaleChanged({
    required String locale,
  }) async {
    if (state.locale != locale) {
      await _appService.setLocale(locale: locale);

      emit(
        state.copyWith(
          locale: locale,
        ),
      );
    }
  }
}
