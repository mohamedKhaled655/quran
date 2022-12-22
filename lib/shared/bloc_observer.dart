import 'package:bloc/bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  
 void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- cubit: ${bloc.runtimeType}');
  }
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  
void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- cubit: ${bloc.runtimeType}, change: $change');
  }
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
 
void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- cubit: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  
  @override
  void onClose(Cubit cubit) {
    super.onClose(cubit);
    print('onClose -- cubit: ${cubit.runtimeType}');
  }
}
}