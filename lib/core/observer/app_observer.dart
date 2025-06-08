import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    if (kDebugMode) {
      print('[Alvi Logger - Bloc Event] ${bloc.runtimeType}: $event');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      print('[Alvi Logger - Bloc Change] ${bloc.runtimeType}: $change');
    }
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    if (kDebugMode) {
      print('[Alvi Logger - Bloc Transition] ${bloc.runtimeType}: $transition');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      print('[Alvi Logger - Bloc Error] ${bloc.runtimeType}: $error');
    }
    super.onError(bloc, error, stackTrace);
  }
}
