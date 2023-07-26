import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tiktok/core/utils/method/aliases.dart';

class AppBlocObserver extends BlocObserver {
  @override
  AppBlocObserver();

  @override
  void onCreate(BlocBase bloc) {
    logIt.i('BLoC: ${bloc.runtimeType} created');
    super.onCreate(bloc);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    logIt.i('Event: ${event.runtimeType} added');
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    logIt.i(
      'onChange-current -- ${bloc.runtimeType}, ${change.currentState}',
    );
    logIt.i(
      'onChange-next -- ${bloc.runtimeType}, ${change.nextState}',
    );
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase<dynamic> bloc) {
    super.onClose(bloc);
    logIt.i(
      'onClose -- ${bloc.runtimeType}',
    );
  }
}
